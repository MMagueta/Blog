(require 'ox-publish)

(setq org-export-with-toc nil)

(setq org-publish-project-alist
      '(("posts"
         :base-directory "posts/"
         :base-extension "org"
         :publishing-directory "public/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :auto-sitemap nil
	 :exclude "header.org"
         :sitemap-title "Index"
         :sitemap-filename "index.org"
         :sitemap-style list
         :author "Marcos Magueta"
         :email "maguetamarcos@gmail.com"
         :with-creator t)
	("images"
	 :base-directory "posts/images"
	 :base-extension "png\\|jpg"
	 :publishing-directory "public/images"
	 :publishing-function org-publish-attachment)
        ("css"
         :base-directory "css/"
         :base-extension "css"
         :publishing-directory "public/css"
         :publishing-function org-publish-attachment
         :recursive t)
         ("all" :components ("posts" "css"))))
