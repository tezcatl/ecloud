#! /usr/bin/emacs23 --script
 (load-file "html6.el")
 (require 'html6)

(html
 ($ 'head
    ($ 'page-title "Mi primer página CGI")
    )
 ($ 'document
    ($ 'title "Mi primer proyecto de página CGI")
    ($ 'bloq ($ 'subtitle "Resuelta el tema básico de reglas de reescritura de URL de .htaccess")
       ($ 'para "¡Hola Mundo!")
       ($ 'para "Query STRING:" (getenv "QUERY_STRING"))
       ($ 'para "Query URL:" (getenv "PATH_TRANSLATED"))
       )
    )
 )