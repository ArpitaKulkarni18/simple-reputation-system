;; Simple Reputation System
;; A minimal implementation to track and update user reputations.

;; Data map to store reputation scores for each principal
(define-map reputations principal int)

;; Error codes
(define-constant err-invalid-amount (err u100))
(define-constant err-not-positive (err u101))

;; Set or update a user's reputation score
(define-public (set-reputation (user principal) (score int))
  (begin
    (asserts! (>= score 0) err-not-positive)
    (map-set reputations user score)
    (ok true)))

;; Get the reputation score of a user
(define-read-only (get-reputation (user principal))
  (ok (default-to 0 (map-get? reputations user))))

