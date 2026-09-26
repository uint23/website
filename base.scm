(define site-title "netcat::uk")

(define (base title content)
  (string-append
    "<!DOCTYPE html>\n"
    "<html>\n"
    "<head>\n"
    "\t<meta charset=\"UTF-8\">\n"
    "\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
    "\t<title>" (escape title) "</title>\n"
    "\t<link rel=\"stylesheet\" href=\"/style.css\" type=\"text/css\">\n"
    "</head>\n"
    "<body>\n"
    "\t<main>\n"
    content
    "\n\t</main>\n"
    "\t<footer>\n"
    "\t\t<a href=\"https://call-cc.org/\">"
    "<img src=\"/Images/SiteStuff/ChickenScheme.png\" alt=\"CHICKEN Scheme\">"
    "</a>\n"
    "\t\t<span>Made with Lisp</span>\n"
    "\t</footer>\n"
    "</body>\n"
    "</html>\n"))

