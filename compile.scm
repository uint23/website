(import scheme
        (chicken base)
        (chicken file)
        (chicken io)
        (chicken pathname))

(load "primitives.scm")
(load "base.scm")

(define source "pages")
(define output "out")

(define (scm? path)
  (equal? (pathname-extension path) "scm"))

(define (relative path)
  (substring path (+ (string-length source) 1)))

(define (page-title path)
  (let ((name (pathname-file path)))
    (if (equal? name "index")
        site-title
        (string-append name " @ " site-title))))

(define (read-page path)
  (call-with-input-file path
    (lambda (in)
      (let loop ((parts '()))
        (let ((form (read in)))
          (if (eof-object? form)
              (apply string-append (reverse parts))
              (let ((value (eval form)))
                (loop
                  (if (or (html? value)
                          (string? value))
                      (cons (render value) parts)
                      parts)))))))))

(define (ensure-parent path)
  (let ((parent (pathname-directory path)))
    (if parent
        (create-directory parent #t))))

(define (compile-page path)
  (let* ((rel (relative path))
         (dest (string-append
                 output
                 "/"
                 (pathname-replace-extension rel "html")))
         (body (read-page path)))
    (ensure-parent dest)
    (call-with-output-file dest
      (lambda (out)
        (display (base (page-title path) body) out)))
    (print path " -> " dest)))

(define (copy-static path)
  (let ((dest (string-append output "/" (relative path))))
    (ensure-parent dest)
    (copy-file path dest #t)))

(if (directory-exists? output)
    (delete-directory output #t))

(create-directory output #t)

(find-files source
  #:action
  (lambda (path ignored)
    (cond
      ((directory-exists? path)
       #f)
      ((scm? path)
       (compile-page path))
      (else
       (copy-static path)))
    ignored))

