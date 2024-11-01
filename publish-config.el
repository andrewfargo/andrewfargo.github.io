;;; publish-config.el
;;; This document specifies my org-publish settings,
;;; particularly those used for this website.


(defun get-repo-file (filePath)
  (concat "/home/clover/Repos/andrewfargo.github.io" filePath))

(setq dfargo-header "<div class=\"header\">
<a href=\"/\">dfargo.com</a>
<a href=\"%s\">(up)</a>
<a href=\"/pages/Research/sitemap.html\">Research</a>
<a href=\"/pages/Monologues/sitemap.html\">Monologues</a>
<a href=\"/pages/Files/sitemap.html\">Files</a>
<p>(c) 2024, Andrew N. Fargo</p>
</div>")

(setq dfargo-stylesheet "<link rel=\"stylesheet\" type=\"text/css\" href=\"/style.css\">")

(defun dfargo-getcomponent (component-name)
  `(,(format "%s" component-name)
	 :base-directory ,(get-repo-file (format "/src/%s/" component-name))
	 :publishing-directory ,(get-repo-file (format "/pages/%s/" component-name))
	 :auto-sitemap t
	 :with-toc nil
	 :sitemap-sort-files anti-chronologically
	 :html-link-up ,(format "/pages/%s/sitemap.html" component-name)
	 :html-link-home "/"
	 :html-head-include-default-style nil
	 :html-home/up-format ,dfargo-header
	 :html-head ,dfargo-stylesheet))

(setq org-publish-project-alist
      `(("dfargo.com" :components ("Research" "Monologues" "Files"))
	,(dfargo-getcomponent "Research")
	,(dfargo-getcomponent "Monologues")
	,(dfargo-getcomponent "Files")))
		 :
