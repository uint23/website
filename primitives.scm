(define (html text)
  (cons 'html text))

(define (html? value)
  (and (pair? value)
       (eq? (car value) 'html)))

(define (escape text)
  (let ((out (open-output-string)))
    (for-each
      (lambda (c)
        (display
          (case c
            ((#\&) "&amp;")
            ((#\<) "&lt;")
            ((#\>) "&gt;")
            ((#\") "&quot;")
            (else c))
          out))
      (string->list text))
    (get-output-string out)))

(define (render value)
  (cond
    ((html? value)
     (cdr value))
    ((string? value)
     (escape value))
    ((number? value)
     (number->string value))
    ((char? value)
     (escape (string value)))
    ((null? value)
     "")
    ((list? value)
     (apply string-append (map render value)))
    (else
     "")))

(define (contents values)
  (apply string-append (map render values)))

(define (wrap tag values)
  (html
    (string-append
      "<" tag ">"
      (contents values)
      "</" tag ">")))

(define (attrs id class)
  (string-append
    (if id
        (string-append " id=\"" (escape id) "\"")
        "")
    (if class
        (string-append " class=\"" (escape class) "\"")
        "")))

(define (text value)
  value)

(define (raw value)
  (html value))

(define (handwritten path)
  (html
    (call-with-input-file path
      (lambda (in)
        (read-string #f in)))))

(define (h1 . body)
  (wrap "h1" body))

(define (home-link)
  (html "<a id=\"back-arrow\" href=\"/index.html\">⇐</a>"))

(define (home-h1 . body)
  (h1
    (home-link)
    " "
    body))

(define (h2 . body)
  (wrap "h2" body))

(define (home-h2 . body)
  (h2
    (home-link)
    " "
    body))

(define (h3 . body)
  (wrap "h3" body))

(define (home-h3 . body)
  (h3
    (home-link)
    " "
    body))

(define (h4 . body)
  (wrap "h4" body))

(define (home-h4 . body)
  (h4
    (home-link)
    " "
    body))

(define (h5 . body)
  (wrap "h5" body))

(define (home-h5 . body)
  (h5
    (home-link)
    " "
    body))

(define (h6 . body)
  (wrap "h6" body))

(define (home-h6 . body)
  (h6
    (home-link)
    " "
    body))

(define (p . body)
  (wrap "p" body))

(define (bold . body)
  (wrap "strong" body))

(define (italic . body)
  (wrap "em" body))

(define (code . body)
  (wrap "code" body))

(define (pre . body)
  (wrap "pre" body))

(define (blockquote . body)
  (wrap "blockquote" body))

(define (table . body)
  (wrap "table" body))

(define (tr . body)
  (wrap "tr" body))

(define (th . body)
  (wrap "th" body))

(define (td . body)
  (wrap "td" body))

(define (div . body)
  (wrap "div" body))

(define (span . body)
  (wrap "span" body))

(define (link href . body)
  (html
    (string-append
      "<a href=\"" (escape href) "\""
      ">"
      (contents body)
      "</a>")))

(define (image src #!key (alt "") (id #f) (class #f))
  (html
    (string-append
      "<img src=\"" (escape src) "\""
      " alt=\"" (escape alt) "\""
      (attrs id class)
      ">")))

(define (li . body)
  (wrap "li" body))

(define (ul . items)
  (wrap "ul" items))

(define (ol . items)
  (wrap "ol" items))

(define (br)
  (html "<br>"))

(define (hr)
  (html "<hr>"))

(define (anchor id)
  (html
    (string-append
      "<a id=\"" (escape id) "\"></a>")))

