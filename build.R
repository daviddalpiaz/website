# clean publish directory
file.remove(list.files("public/", full.names = TRUE, recursive = TRUE), recursive = TRUE)

# function to extract post titles from .Rmd files
get_post_title = function(file) {
  rmarkdown::yaml_front_matter(file)$title
}

# get blog post filenames with full path
original_blog_files = list.files("blog", full.names = TRUE)

# remove full path and date information
filenames = stringr::str_sub(original_blog_files, start = 17)

# extract data information
dates = stringr::str_extract(original_blog_files, pattern = "[0-9]+-[0-9]+-[0-9]+")

# get titles
titles = sapply(original_blog_files, get_post_title)

# aggregate blog post information as data frame
blog_posts = data.frame(
  date = dates,
  filename = stringr::str_replace(filenames, pattern = ".Rmd", replacement = ".html"),
  title = titles
)

# reorder so new posts come first
blog_posts = blog_posts[rev(order(blog_posts$date)), ]

# convert to list
blog_posts = split(blog_posts, seq(nrow(blog_posts)))

# write line to put into blog page
write_blog_html = function(data) {
  paste0("- <span>", data["date"], "</span> » [", data["title"], "](", data["filename"], ")")
}

# write lines to file
file_conn = file("blog-posts.Rmd")
writeLines(stringr::str_c(sapply(blog_posts, write_blog_html)), file_conn)
close(file_conn)

# temporarily move "blog posts" to top level project directory
# use modified names without dates
file.copy(from = original_blog_files,to = filenames)

# render site
rmarkdown::render_site(encoding = 'UTF-8')

# remove "blog posts" from top level project directory
file.remove(filenames)

# preview
system(paste(shQuote('open'), shQuote("public/index.html")), wait = FALSE, ignore.stderr = TRUE)
