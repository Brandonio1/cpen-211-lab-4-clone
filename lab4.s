.globl binary_search
binary_search:
  //r0 = *numbers
  //r1 = key
  //r2 = length
  MOV r3, #0                  //r3 = startIndex
  SUB r4, r2, #1              //r4 = endIndex
  MOV r5, r4, LSR #1          //r5 = middleIndex    //might be LSR #2
  MVN r6, #1                  //r6 = keyIndex
  MOV r7, #1                  //r7 = NumIters
  MVN r8, #1                  //r8 = -1

  loop: CMP r6, r8
        BNE DONE
          CMP r3, r4
            BGT DONE

          LDR r9, [r5, r0, LSL #2]    //r9 = numbers[middleIndex]
          CMP r1, r9
            MOVEQ r6, r5
            SUBGT r4, r5, #1
            ADDLT r3, r5, #1

          RSB r10, r7, #0             //r10 = -numIters
          MOV r9, r10                 //num[mid] = -numIters
          SUB r11, r4, r3             //r11 = end - start
          ADD r3, r11, LSR #1         //mid = start - r11/2
          ADD r7, r7, #1              //numIters++
  B loop
  DONE: MOV r0, r6  //return keyIndex

  MOV pc,lr