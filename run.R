# author: Tinashe Tapera
# date: Novembe 2021

# this file renders both the resume and CV in PDF and HTML format

# render one page resume HTML
here::here("/root/project/")
rmarkdown::render(input = here::here("one_page_resume", "one_page_resume_pagedown.Rmd"),
                  output_file = "tinashemtapera_resume.html",
                  output_options = list(
                    css = c('css/custom_resume.css', 'css/styles_html.css', 'resume'),
                    self_contained = TRUE
                  ),
                  params = list(
                    doctype = "HTML"
                  )
)


# render one page resume PDF
rmarkdown::render(input = here::here("one_page_resume", "one_page_resume_pagedown.Rmd"),
                  output_file = "tinashemtapera_resume.html",
                  output_options = list(
                    css = c('css/custom_resume.css', 'css/styles_pdf.css', 'resume')
                  ),
                  params = list(
                    doctype = "PDF"
                  )
)

# render long form cv
rmarkdown::render(input = here::here("long_form_cv", "long_form_cv_vitae.Rmd"),
                  output_file = "tinashemtapera_cv.html",
                  params = list(
                    googlescholarid = "9N6a5jsAAAAJ"
                  )
)

