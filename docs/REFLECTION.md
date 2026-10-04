# Reflection – Individual Assignment III

*Name:* Akandwanaho Joshua
*ID:* 20251SEN321
*Course:* INSY 8311 – Database Development with PL/SQL

## What I Learned

*GOTO statements.* I learned that PL/SQL supports the GOTO statement but that it comes with strict rules: you cannot jump into a nested block, into an IF statement, into a loop, or out of an exception handler. In A3 I triggered PLS-00375 by jumping into an IF block and then fixed it by placing the label in the same enclosing block. In A2 I used GOTO as a "skip this row" mechanism inside a cursor loop.

*Functions.* I created five stored functions covering four important concepts:
- fn_annual_salary – simple computation using a %TYPE anchored variable.
- fn_years_of_service – date arithmetic with MONTHS_BETWEEN.
- fn_calculate_tax – a progressive tax calculation with several IF branches.
- fn_dept_name – a lookup function with an exception handler returning 'UNKNOWN' when no row is found.
- fn_validate_payroll – a combined validation function that uses a %ROWTYPE record and multiple business rules.

*Calling functions from SQL.* B5 showed that PL/SQL functions can be selected directly, and even nested (e.g., computing tax on the annual salary). I learned the practical rule that a function called from SQL must not modify table state (no DML inside a pure SQL context).

## Challenges

- Getting the A3 broken version to fail cleanly, because SQL Developer sometimes hides the compile error unless you look at the Log panel.
- Remembering that GOTO cannot cross block, loop, or IF boundaries.
- Deciding the tax bands for B3 so that the arithmetic would be easy to verify.

## How GOTO Compares with Alternatives

Rewriting A2 without GOTO (A4) using CONTINUE made the code shorter, easier to read, and less error-prone. My takeaway is that GOTO is a legacy tool — it should only be used when no structured alternative exists, and even then sparingly.
