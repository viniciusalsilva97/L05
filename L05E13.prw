#INCLUDE 'totvs.ch'

#DEFINE NMAX 50

User Function L05E13()
    local aCaracteres := {}
    local nCont, nNum := 0

    populaVetor(aCaracteres, nCont, nNum)
Return 

Static Function populaVetor(aCaracteres, nCont, nNum)
    local cMsg := ""

    for nCont := 1 to NMAX 
        nNum := Randomize(65, 90)
        Aadd(aCaracteres, chr(nNum))  
        cMsg += cValToChar(aCaracteres[nCont]) + ", "      
    next
    FwAlertInfo(cMsg, "Array de Letras Maiúsculas")
Return 
