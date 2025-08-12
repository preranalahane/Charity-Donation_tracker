;; Charity Donation Tracker
;; This contract allows users to donate STX to a charity wallet and check total donations.

;; Data variables
(define-constant charity-wallet 'ST3J2GVMMM2R07ZFBJDWTYEYAR8FZH5WKDTFJ9AHA)
(define-data-var total-donations uint u0)

;; Error constants
(define-constant err-invalid-amount (err u100))

;; Function 1: Donate to charity
(define-public (donate (amount uint))
  (begin
    (asserts! (> amount u0) err-invalid-amount)
    (try! (stx-transfer? amount tx-sender charity-wallet))
    (var-set total-donations (+ (var-get total-donations) amount))
    (ok true)
  )
)

;; Function 2: View total donations
(define-read-only (get-total-donations)
  (ok (var-get total-donations))
)
