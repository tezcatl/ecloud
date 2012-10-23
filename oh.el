#!/usr/bin/emacs23 --script

(load-file "html6.el")
(require 'html6)

(html
 ($ 'head
    ($ 'page-title "Mi aplicación CGI | Hecha con Emacs Lisp")
    )
 ($ 'document
    ($ 'title "Nombre inicial: E-cloud")
    ($ 'bloq ($ 'subtitle "Resuelto:")
       ($ 'ul
	  ($ 'li "Reglas de reescritura URL->query_string (en .htaccess)<br/>"
	     ($ 'p "Requisitos:"
		($ 'ul
		   ($ 'li "AddHandler cgi-script .el .elc")
		   ($ 'li "Options +ExecCGI +FollowSymLinks"
		      "<br/> Estas permiten manejar los scripts de elisp")
		   ($ 'li "RewriteBase /cgi")
		   ($ 'li "RewriteRule ^*url-part*$ /cgi/script.el?*params* [PT,QSA]"
		      "<br/> PT pasa la URL al cgi-script supuesto"
		      "<br/> QSA agrega los nuevos parámetros a los anteriores dados tras el '?'"))))
	  ($ 'li "Cabeceras de contenido predeterminado:"
	     ($ 'ul
		($ 'li "AddDefaultCharset UTF-8")
		($ 'li "AddType text/html .html .el")))))
    ($ 'bloq ($ 'subtitle "Pendiente:")
       ($' ul
	   ($ 'li "Conectarse a base de datos CouchDB para contenido dinámico")
	   ($ 'li "Autenticación: (!)"
	      ($ 'ul
		 ($ 'li "Por espacio de nombres")
		 ($ 'li "¿En la aplicación o en .htaccess (Ver DigestAuthentication)")
		 ($ 'li "¿ACL vía groups htpasswd (+ un poco de aplicación)?")
		 ($ 'li "Que los usuarios puedan cambiar sus propias contraseñas")))
	   ($ 'li "Que el intérprete de 'HTML 6' (s-expressions) sea más flexible"
	      ($ 'ul
		 ($ 'li "Actualmente un elemento se crea con ($ 'etiqueta-o-alias nodos)")
		 ($ 'li "No permite atributos")
		 ($ 'li "Es un poco pesado para aplicar elementos en-línea")))
	   ($ 'li "Incluir estilos y otro código de aplicación"
	      ($ 'ul ($ 'li "¿Qué tanto debe ir en javaScript, en elisp, en apache?")))))
    ($ 'bloq ($ 'h4 "Códigos de trabajo")
       ($ 'para "Query STRING:" (getenv "QUERY_STRING"))
       ($ 'para "Query URL:" (getenv "ACTION")))
    )
 )