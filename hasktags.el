;; Copyright 2011 Pavlo Kerestey. All rights reserved.

;; Redistribution and use in source and binary forms, with or without modification, are
;; permitted provided that the following conditions are met:

;;    1. Redistributions of source code must retain the above copyright notice, this list of
;;       conditions and the following disclaimer.

;;    2. Redistributions in binary form must reproduce the above copyright notice, this list
;;       of conditions and the following disclaimer in the documentation and/or other materials
;;       provided with the distribution.

;; THIS SOFTWARE IS PROVIDED BY Pavlo Kerestey ''AS IS'' AND ANY EXPRESS OR IMPLIED
;; WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
;; FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Pavlo Kerestey OR
;; CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
;; SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
;; ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;; NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
;; ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

;; The views and conclusions contained in the software and documentation are those of the
;; authors and should not be interpreted as representing official policies, either expressed
;; or implied, of Pavlo Kerestey.

(add-to-list 'exec-path (file-name-directory load-file-name))

(defun hasktags ()
  "regenerate TAGS file using hasktags in the project root (found by TAGS file)"
  (start-process "*generate-hasktags*" "*generate-hasktags*" "generate-hasktags.sh"))

(add-hook 'after-save-hook 'hasktags)
(setq tags-revert-without-query 1)
(provide 'hasktags)