;; (require 'org)
(require 'ox-publish)

(setq org-export-with-toc nil)

(setq org-publish-project-alist
      '(("posts"
         :base-directory "posts/"
         :base-extension "org"
         :publishing-directory "/var/www/blog/"
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
	 :publishing-directory "/var/www/blog/images"
	 :publishing-function org-publish-attachment)
        ("css"
         :base-directory "css/"
         :base-extension "css"
         :publishing-directory "/var/www/blog/css"
         :publishing-function org-publish-attachment
         :recursive t)
         ("all" :components ("posts" "css"))))

(defun rss-publish ()
  (progn
    (org-babel-tangle-file "scripts/rss.org")
    (eval-expression (load-file "scripts/rss.el"))
    (shell-command "mkdir -p generated/static/ && mv rss.xml generated/static/")))

(progn
  (org-publish-all)
  (rss-publish))

(provide 'publish)
