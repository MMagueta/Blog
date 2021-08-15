(load-file "./simple-httpd.el")
(require 'simple-httpd)
(require 'ox-publish)

(httpd-stop)

(setq org-publish-project-alist
      '(("posts"
         :base-directory "posts/"
         :base-extension "org"
         :publishing-directory "public/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :auto-sitemap t
         :sitemap-title "Home"
         :sitemap-filename "index.org"
         :sitemap-style list
         :author "Marcos Magueta"
         :email "maguetamarcos@gmail.com"
	 :html-preamble
         "<div class=\"header\">
              <a href=\"https://marcosmagueta.com\">Magueta's internet board</a>
              <div class=\"sitelinks\">
                  <a href=\"http://github.com/MMagueta\">Github</a>
              </div>
          </div>"
         :with-creator t)
        ("css"
         :base-directory "css/"
         :base-extension "css"
         :publishing-directory "public/css"
         :publishing-function org-publish-attachment
         :recursive t)
        ("all" :components ("posts" "css"))))

(org-publish-all)

(setq httpd-indexes
  '("sitemap.html"
    "sitemap.htm")
  "File served by default when accessing a directory.")

(setq httpd-root "./public")
(setq httpd-port 7474)
(httpd-start)
