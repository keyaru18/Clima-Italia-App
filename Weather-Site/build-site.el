;; load the publishing system
(require 'ox-publish)
(message "INICIANDO PE CAUSA")

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

;; Customize the HTML output
(setq org-html-validation-link nil            
      org-html-head-include-scripts nil       
      org-html-head-include-default-style nil 
      org-html-head "
<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />
<style>
  body {
    background-image: url('https://c4.wallpaperflare.com/wallpaper/719/815/793/anime-art-anime-girl-rain-sadness-wallpaper-preview.jpg');
    background-size: cover;
    background-attachment: fixed;
    background-position: center;
  }

  .corner-gif-right {
    position: fixed;
    top: -100px;
    right: -200px;
    width: 800px;
    height: 800px;
    z-index: 1000;
  }

  .corner-gif-left {
    position: fixed;
    top: 180px;
    left: 20px;
    width: 350px;
    height: 350px;
    z-index: 1000;
  }

  .gif-container img {
    width: 100%;
    height: 100%;
    object-fit: contain;
  }
</style>
<div class=\"corner-gif-right gif-container\">
  <img src=\"./images/P3Rt-unscreen.gif\" alt=\"Right Corner GIF\">
</div>
<div class=\"corner-gif-left gif-container\">
  <img src=\"https://www.ahiva.info/gifs-animados/Clima/Lluvia/Lluvia-31.gif\" alt=\"Left Corner GIF\">
</div>")

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "org-site:main"
             :recursive t
             :base-directory "./content"
             :publishing-function 'org-html-publish-to-html
             :publishing-directory "./public"
             :with-author nil           
             :with-creator t            
             :with-toc t                
             :section-numbers nil       
             :time-stamp-file nil)
       ;; Componente para publicar imágenes
       (list "org-site:images"
             :base-directory "./content/images"
             :base-extension "gif\\|jpg\\|png"
             :publishing-directory "./public/images"
             :recursive t
             :publishing-function 'org-publish-attachment)))

;; Generate the site output
(org-publish-all t)
(message "FINALIZADO, A LA FIRME!")
