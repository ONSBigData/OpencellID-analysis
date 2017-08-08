library(ezknitr)

ezknit(file = "analysis/Part_1_Analysis.Rmd",
       out_dir = "reports/part1",
       fig_dir = "figures",
       keep_html = FALSE)

ezknit(file = "analysis/Part_2_KDE.Rmd",
       out_dir = "reports/part2",
       fig_dir = "figures",
       keep_html = FALSE)

ezknit(file = "analysis/Part_3_APPENDIX-B.Rmd",
       out_dir = "reports/part3",
       fig_dir = "figures",
       keep_html = FALSE)

wd = getwd()

mdList = list.files(path = file.path(wd, "reports"),
                    pattern = ".*Part.*\\.md",
                    recursive = TRUE,
                    full.names = TRUE)

getNewPath = function(oldPath) {
  dirPath = dirname(oldPath)
  newPath = file.path(dirPath, "README.md")
  return(newPath)
}

file.rename(mdList, sapply(mdList, getNewPath, simplify = "array"))
