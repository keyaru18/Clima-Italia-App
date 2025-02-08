;; load the publishing system
(require 'ox-publish)
(message "Construcción completa")

;; Set the package installation directory
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

;; Load the publishing system
(require 'ox-publish)

;; Customize the HTML output (Manteniendo el Framework y Agregando Imagen de Fondo)
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "
<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />
<style>
  body {
    background-image: url('https://c4.wallpaperflare.com/wallpaper/719/815/793/anime-art-anime-girl-rain-sadness-wallpaper-preview.jpg');
    background-size: cover;
    background-attachment: fixed;
    background-position: center;
  }
</style>")


;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "org-site:main"
             :recursive t
             :base-directory "./content"
             :publishing-function 'org-html-publish-to-html
             :publishing-directory "./public"
             :with-author nil           ;; Don't include author name
             :with-creator t            ;; Include Emacs and Org versions in footer
             :with-toc t                ;; Include a table of contents
             :section-numbers nil       ;; Don't include section numbers
             :time-stamp-file nil)))    ;; Don't include time stamp in file

;; Generate the site output
(org-publish-all t)

(message "Generación Completa!")
