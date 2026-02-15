;; Errors
(define-constant ERR_INVALID_WITHDRAW_AMOUNT (err u100))
(define-constant ERR_EXCEEDED_MAX_BORROW (err u101))
(define-constant ERR_CANNOT_BE_LIQUIDATED (err u102))

;; Constants
(define-constant LTV_PERCENTAGE u70)
(define-constant INTEREST_RATE_PERCENTAGE u10)
(define-constant LIQUIDATION_THRESHOLD_PERCENTAGE u100)
(define-constant ONE_YEAR_IN_SECS u31556952)

;; Storage

;; Total amount of sBTC we have as collateral for loans
(define-data-var total-sbtc-collateral uint u0)

;; Total amount of STX that lenders have deposited
(define-data-var total-stx-deposits uint u1)

;; Total amount of STX that borrowers have borrowed
(define-data-var total-stx-borrows uint u0)

;; Last time interest was accrued
(define-data-var last-interest-accrual uint (get-latest-timestamp))

;; Cumulative interest earned (yield) in bips per deposited STX token (interest * 10000)
(define-data-var cumulative-yield-bips uint u0)

;; Map of user principal to amount of sBTC they have as collateral
(define-map collateral
    { user: principal }
    { amount: uint }
)

;; Map of user principal to amount of STX they have deposited
(define-map deposits
    { user: principal }
    {
        amount: uint,
        yield-index: uint,
    }
)

;; Map of user principal to amount of STX they have borrowed
(define-map borrows
    { user: principal }
    {
        amount: uint,
        last-accrued: uint,
    }
)

;; ------------------------------------
;;               LENDING
;; ------------------------------------

;; @desc Deposits STX into the lending pool
;; @param amount: The amount of STX to deposit
;; @returns (response bool)
(define-public (deposit-stx (amount uint))
    ;; TODO
    (ok true)
)

;; @desc Withdraws STX from the lending pool
;; @param amount: The amount of STX to withdraw
;; @returns (response bool)
(define-public (withdraw-stx (amount uint))
    ;; TODO
    (ok true)
)

;; @desc Gets the total amount of pending STX yield that the lender has earned
;; The user is the tx-sender 
(define-read-only (get-pending-yield)
    (ok u0)
)

;; ------------------------------------
;;               BORROWING
;; ------------------------------------

;; @desc Borrows STX from the lending pool
;; @param collateral-amount: The amount of sBTC to use as collateral
;; @param amount-stx: The amount of STX to borrow
;; @returns (response bool)
(define-public (borrow-stx
        (collateral-amount uint)
        (amount-stx uint)
    )
    (ok true)
)

;; @desc Repays the loan in full
;; @returns (response bool)
(define-public (repay)
    (ok true)
)

;; @desc Gets the debt for a user
;; Includes the amount of STX they have borrowed + interest that has accumulated
;; @param user: The user to get the debt for
;; @returns (response uint)
(define-read-only (get-debt (user principal))
    (ok u0)
)

;; ------------------------------------
;;               LIQUIDATION
;; ------------------------------------

;; @desc Liquidates a borrower
;; @param user: The user to liquidate
;; @returns (response bool)
(define-public (liquidate (user principal))
    (ok true)
)

;; ------------------------------------
;;               HELPERS
;; ------------------------------------

;; @desc Gets the price of sBTC in STX from the oracle
;; @returns (response uint)
(define-public (get-sbtc-stx-price)
    (ok u0)
)

;; @desc Gets the latest timestamp
;; @returns (response uint)
(define-private (get-latest-timestamp)
    u0
)

;; @desc Accrues interest for all lenders based on total borrowed STX
;; @returns (response bool)
(define-private (accrue-interest)
    (ok true)
)