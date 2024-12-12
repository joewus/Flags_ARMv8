

/* flags_asm.asm 12.12.2024 */

/* X1 = address/pointer = 0x7ffffff334 */
/* 0x7fffffffffffffff = 9223372036854775807 */
/* 0xffffffffffffffff = -1 is represented in two's complement(hexadecimal) */
/* 0x8000000000000000 = -9223372036854775808 */

.global flags_asm 

flags_asm: 
    MOV X8, #0            // sets X8 = 0
    MOV X6, X0            // first argument 
    MOV X7, X1            // second argument 

    // Check if the first argument (X6) is negative
    ADDS X6, X6, #0       // Sets NZCV flags based on X6
    CSET X9, MI           // Set X9 to 1 if negative (MI condition), otherwise 0
    ADD X8, X8, X9        // Add 1 to X8 if negative

    // Add the two arguments and check for overflow
    ADDS X6, X6, X7       // Adds X6 and X7, setting NZCV flags if there's an overflow
    CSET X9, VS           // Set X9 to 1 if overflow (VS condition), otherwise 0
    MOV X10, #10          // Load 10 into X10
    MUL X9, X9, X10       // Multiply X9 by 10 if overflow, else 0
    ADD X8, X8, X9        // Add 10 to X8 if overflow ie X9 to X8
    // Copy NZCV flags to X14 for debugging or further inspection
    MRS X14, NZCV  //move register from system, this is helpful during debugging(not really affecting my logic)       

    // Add 42 to X8 to complete the encoding
    ADD X8, X8, #42       

    // Store the result in the memory address pointed to by X2
    STR X8, [X2]          

    // Set return value to 0 (success)
    MOV X0, #0
    BR LR             /* Return to calling function(to the c function that called the assembly) */

    // Return to calling function
    // RET                   
