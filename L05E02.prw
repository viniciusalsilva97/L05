#INCLUDE 'totvs.ch'

#DEFINE NMAX 10

User Function L05E02()
    local aVetor  := {}
    local aMatriz := {}
    local nNumero := 0
    local nCont   := 0
    local cOrdem  := ""
    local cInvert := CRLF + CRLF 

    for nCont := 1 to NMAX
        nNumero := Randomize(1, 100)
        Aadd(aVetor, nNumero)  
        cOrdem += cValToChar(aVetor[nCont]) + ", "      
    next

    for nCont := NMAX to 1 step - 1
        cInvert += cValToChar(aVetor[nCont]) + ","
    next

    Aadd(aMatriz, {cOrdem, cInvert})

    FwAlertInfo(ArrToKStr(aMatriz, CRLF), "Array")
    
Return 
