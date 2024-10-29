.globl binary_search
binary_search:
  //r0 = *numbers
  //r1 = key
  //r2 = length
  MOV r3, #0                  //r3 = startIndex
  SUB r4, r2, #1              //r4 = endIndex
  MOV r5, r4, LSR #1          //r5 = middleIndex
  MOV r6, #-1                  //r6 = keyIndex
  MOV r7, #1                  //r7 = NumIters
  MOV r8, #-1                  //r8 = -1

  loop: CMP r6, r8
        BNE DONE
          CMP r3, r4
            BGT DONE

          LDR r9, [r0, r5, LSL #2]    //r9 = numbers[middleIndex]

          //num[mid] < 0

          CMP r9, r1
            MOVEQ r6, r5
            SUBGT r4, r5, #1
            ADDLT r3, r5, #1

          RSB r9, r7, #0             //r10 = -numIters

          SUB r11, r4, r3             //r11 = end - start
          ADD r5, r3, r11, LSR #1     //mid = start + r11/2

          ADD r7, r7, #1              //numIters++
        B loop
  DONE: MOV r0, r6    //return keyIndex

  MOV pc,lr