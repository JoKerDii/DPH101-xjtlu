About rmarkdown: 
https://bookdown.org/yihui/rmarkdown/



### How to produce PDF from rmarkdown:
1. In r script (not rmarkdown):
```r
install.packages("tinytex")
```
2. Check by the response of TRUE
```r
tinytex:::is_tinytex()
```
3. Install MikTex from :
https://miktex.org/2.9/setup
4. Click Knit -> Knit to PDF (recommend to set **UTF-8** as encoding)

### PS: 

I've got "Chinese character issue", here are my solutions:

* Sol 1: Change the YAML header manually or avoid chinese characters
```markdown
date: "`r Sys.Date()`"
```
* Sol 2: Install rticles package
```r
install.packages("devtools")
devtools::install_github(“rstudio/rticles”)
```
When create file, File -> New File -> R Markdown -> From Template -> CTeX Documents
