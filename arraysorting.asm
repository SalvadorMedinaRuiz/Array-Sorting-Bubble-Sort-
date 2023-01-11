;;Array sorting
		.ORIG		x3000
		AND 		R2, R2, 0			;Clears R2 
		LD		R3, NUMS			;loads address of NUMS into R3

count		LDR		R0, R3, 0			;R0 will now have the current number in NUMS array from R3
		BRz		done_count			;if R0 is nothing, then your done
		ADD		R2, R2, 1			;incrementing R2 by 1 (R2 is the length of the NUMS array)
		ADD		R3, R3, 1			;incrementing R3 by 1 (R3 is our current position in the NUMS array)
		BR		count

done_count	ADD		R4, R2, 0
		BRz		sorted
;;Do the bubble sort

outerloop	ADD		R4, R4, -1
		BRnz		sorted
		ADD		R5, R4, 0
		LD		R3, NUMS
innerloop	LDR		R0, R3, 0			;So if our first number was 12, R0=12
		LDR		R1, R3, 1			;If our second number is 3, R1=3
		NOT		R2, R1
		ADD		R2, R2, 1			;R3=-3
		ADD		R2, R0, R2			;R2= 12 - 3 = 9. Since 9 is positive, swap
		BRnz		swapped

		STR		R1, R3, 0			;Swaps
		STR		R0, R3, 1			;swaps

swapped		ADD		R3, R3, 1			;increment the array position
		ADD		R5, R5, -1			;decrements the inner loop
		BRp		innerloop
		BR		outerloop


sorted		HALT

NUMS		.FILL		x3500
		.END