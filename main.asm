
push_automatico MACRO          ;macro para realizar los push necesarios de manera automatica
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    PUSH DI
ENDM

pop_automatico MACRO         ;macro para realizar los pop necesarios de manera automatica
    POP DI
    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
ENDM

limpiarpantalla MACRO
    ; PARA CONFIGURAR COLOR DE LA PANTALLA
    MOV ah, 06h
    MOV al, 00H
    mov bh,30h ; 3= COLOR CIAN Y 0 COLOR NEGRO EN LAS LETRAS
    mov cx,0000h
    mov dx,184fh 
    int 10h

    ; PARA POSICIONAR EL CURSOR EN ARRIBA DE LA PANTALLA AL INICIO
    mov ah,02h
    mov bh,00h
    mov dx,0000h
    int 10h
ENDM

obteneropcion MACRO              ;macro que sirve para leer la pulsacion de una tecla
    MOV AH, 01H ; leemos el caracter osea la tecla presionada 01H
    INT 21H ;ejecutamos la interrupcion 
ENDM

imprimir MACRO cadena
    push_automatico
    MOV AX, @data ;obtenemos la data
    MOV DS, AX ;pasamos el registro AX al DS
    MOV AH, 09H ;creamos la interrupcion
    MOV DX, offset cadena ;obtenemos la direccion de memoria de cadena
    INT 21H ; ejecutamos la interrupcion
    pop_automatico
ENDM

imprimirOriginal MACRO
    LOCAL ERROR
    cmp existeFuncion,00H
    JE ERROR
    add Original5[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Original5[0002],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Original4[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Original4[0002],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Original3[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Original3[0002],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Original2[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Original2[0002],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Original1[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Original1[0002],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Original0[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Original0[0002],30H ; regresamos el valor a codigo ascii para poder imprimir

    imprimir iguales
    imprimir salto
    imprimir InicioFuncionOriginal
    imprimir Original5
    imprimir equis5
    imprimir Original4
    imprimir equis4
    imprimir Original3
    imprimir equis3
    imprimir Original2
    imprimir equis2
    imprimir Original1
    imprimir equis1
    imprimir Original0
    imprimir salto
    imprimir iguales
    

    sub Original5[0001],30H ; regresamos el valor a decimal
    sub Original5[0002],30H ; regresamos el valor a decimal
    sub Original4[0001],30H ; regresamos el valor a decimal
    sub Original4[0002],30H ; regresamos el valor a decimal
    sub Original3[0001],30H ; regresamos el valor a decimal
    sub Original3[0002],30H ; regresamos el valor a decimal
    sub Original2[0001],30H ; regresamos el valor a decimal
    sub Original2[0002],30H ; regresamos el valor a decimal
    sub Original1[0001],30H ; regresamos el valor a decimal
    sub Original1[0002],30H ; regresamos el valor a decimal
    sub Original0[0001],30H ; regresamos el valor a decimal
    sub Original0[0002],30H ; regresamos el valor a decimal
    jmp Menu2
    ERROR:
        limpiarpantalla
        imprimir asteriscos
        imprimir errorExisteFuncion
        imprimir asteriscos
        imprimir salto
        jmp Menu2

ENDM

imprimirDerivada MACRO
    LOCAL ERROR
    cmp existeFuncion,00H
    JE ERROR
    add Derivada4[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Derivada4[0002],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Derivada3[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Derivada3[0002],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Derivada2[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Derivada2[0002],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Derivada1[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Derivada1[0002],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Derivada0[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Derivada0[0002],30H ; regresamos el valor a codigo ascii para poder imprimir

    imprimir iguales
    imprimir salto

    imprimir InicioFuncionDerivada
    imprimir Derivada4
    imprimir equis4
    imprimir Derivada3
    imprimir equis3
    imprimir Derivada2
    imprimir equis2
    imprimir Derivada1
    imprimir equis1
    imprimir Derivada0

    imprimir salto
    imprimir iguales
    

    sub Derivada4[0001],30H ; regresamos el valor a decimal
    sub Derivada4[0002],30H ; regresamos el valor a decimal
    sub Derivada3[0001],30H ; regresamos el valor a decimal
    sub Derivada3[0002],30H ; regresamos el valor a decimal
    sub Derivada2[0001],30H ; regresamos el valor a decimal
    sub Derivada2[0002],30H ; regresamos el valor a decimal
    sub Derivada1[0001],30H ; regresamos el valor a decimal
    sub Derivada1[0002],30H ; regresamos el valor a decimal
    sub Derivada0[0001],30H ; regresamos el valor a decimal
    sub Derivada0[0002],30H ; regresamos el valor a decimal
    jmp Menu2

    ERROR:
        limpiarpantalla
        imprimir asteriscos
        imprimir errorExisteFuncion
        imprimir asteriscos
        imprimir salto
        jmp Menu2
    

ENDM

imprimirIntegral MACRO
    LOCAL ERROR
    cmp existeFuncion,00H
    JE ERROR
    add Integrada6[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Integrada6[0002],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Integrada5[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Integrada5[0002],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Integrada4[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Integrada4[0002],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Integrada3[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Integrada3[0002],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Integrada2[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Integrada2[0002],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Integrada1[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Integrada1[0002],30H ; regresamos el valor a codigo ascii para poder imprimir

    imprimir iguales
    imprimir salto

    imprimir InicioFuncionIntegrada
    imprimir Integrada6
    imprimir equis6
    imprimir Integrada5
    imprimir equis5
    imprimir Integrada4
    imprimir equis4
    imprimir Integrada3
    imprimir equis3
    imprimir Integrada2
    imprimir equis2
    imprimir Integrada1
    imprimir equis1
    imprimir masC

    imprimir salto
    imprimir iguales
    

    sub Integrada6[0001],30H ; regresamos el valor a decimal
    sub Integrada6[0002],30H ; regresamos el valor a decimal
    sub Integrada5[0001],30H ; regresamos el valor a decimal
    sub Integrada5[0002],30H ; regresamos el valor a decimal
    sub Integrada4[0001],30H ; regresamos el valor a decimal
    sub Integrada4[0002],30H ; regresamos el valor a decimal
    sub Integrada3[0001],30H ; regresamos el valor a decimal
    sub Integrada3[0002],30H ; regresamos el valor a decimal
    sub Integrada2[0001],30H ; regresamos el valor a decimal
    sub Integrada2[0002],30H ; regresamos el valor a decimal
    sub Integrada1[0001],30H ; regresamos el valor a decimal
    sub Integrada1[0002],30H ; regresamos el valor a decimal
    jmp Menu2
    ERROR:
        limpiarpantalla
        imprimir asteriscos
        imprimir errorExisteFuncion
        imprimir asteriscos
        imprimir salto
        jmp Menu2

ENDM

reiniciarFuncion MACRO
    MOV Original5[0000], 002BH ;ascci +
	MOV Original5[0001], 00H ;borrar y poner en 0
    MOV Original5[0002], 00H ;borrar y poner en 0
    MOV Original4[0000], 002BH ;ascci +
	MOV Original4[0001], 00H ;borrar y poner en 0
    MOV Original4[0002], 00H ;borrar y poner en 0
    MOV Original3[0000], 002BH ;ascci +
	MOV Original3[0001], 00H ;borrar y poner en 0
    MOV Original3[0002], 00H ;borrar y poner en 0
    MOV Original2[0000], 002BH ;ascci +
	MOV Original2[0001], 00H ;borrar y poner en 0
    MOV Original2[0002], 00H ;borrar y poner en 0
    MOV Original1[0000], 002BH ;ascci +
	MOV Original1[0001], 00H ;borrar y poner en 0
    MOV Original1[0002], 00H ;borrar y poner en 0
    MOV Original0[0000], 002BH ;ascci +
	MOV Original0[0001], 00H ;borrar y poner en 0
    MOV Original0[0002], 00H ;borrar y poner en 0
    
ENDM

reiniciarTemporales MACRO
    MOV Temporal5[0000], 002BH ;ascci +
	MOV Temporal5[0001], 00H ;borrar y poner en 0
    MOV Temporal5[0002], 00H ;borrar y poner en 0
    MOV Temporal4[0000], 002BH ;ascci +
	MOV Temporal4[0001], 00H ;borrar y poner en 0
    MOV Temporal4[0002], 00H ;borrar y poner en 0
    MOV Temporal3[0000], 002BH ;ascci +
	MOV Temporal3[0001], 00H ;borrar y poner en 0
    MOV Temporal3[0002], 00H ;borrar y poner en 0
    MOV Temporal2[0000], 002BH ;ascci +
	MOV Temporal2[0001], 00H ;borrar y poner en 0
    MOV Temporal2[0002], 00H ;borrar y poner en 0
    MOV Temporal1[0000], 002BH ;ascci +
	MOV Temporal1[0001], 00H ;borrar y poner en 0
    MOV Temporal1[0002], 00H ;borrar y poner en 0
    MOV Temporal0[0000], 002BH ;ascci +
	MOV Temporal0[0001], 00H ;borrar y poner en 0
    MOV Temporal0[0002], 00H ;borrar y poner en 0
    
ENDM

leerValorCoeficiente MACRO
    LOCAL SIGUIENTE,CICLO,SALIR1,ExisteSigno,SinSigno,SALIR2,ERROR ; DECLARAMOS QUE ESTAS ETIQUETAS SON SOLO EN ESTA MACRO
    push_automatico
    XOR SI,SI ; reiniciamos el registro SI origen de memoria

    SIGUIENTE: ; reiniciamos la variable llenandola con simbolos $ 
        mov TextoIngresado[SI],'$'
        INC SI ; incrementamos SI 
        cmp SI, 14D
        jle SIGUIENTE ;realiza el salto solamente si es menor o igual a 15

    ;lectura del string 
    mov ah,01h ;mandamos un 1 al registro alto de ax, funcion para leer la entrada desde el teclado
    XOR SI,SI ; reiniciamos el registro SI origen de memoria
    CICLO: 
        int 21H ;hacemos la interrupcion para guardar el caracter leido y lo guardamos en AL
        cmp AL, 13D ;verificamos que no sea el enter
        JE SALIR1 ;si es enter salimos
        MOV TextoIngresado[SI], AL
        inc SI
        jmp CICLO

    SALIR1:
        ; si el usuario ingresa     -       4       0
        ;                           0000    0001    0002

        ; posicion 0000 es la posicion si el usuario ingreso signo o no 
        CMP TextoIngresado[0000], 002BH;verificamos que el usuario haya ingresado signo +
        JE ExisteSigno ;saltamos para analizar con signo
        CMP TextoIngresado[0000], 002DH;verificamos que el usuario haya ingresado signo -
        JE ExisteSigno;saltamos para analizar con signo
        JMP SinSigno;si no se encuentra con signo se dejara el inicial del arreglo que se declaro al inicio

    ExisteSigno:
        CMP TextoIngresado[0001], 0030H 
        JB ERROR ;verificacion de si es menor al codigo 48 en ascii 
        CMP TextoIngresado[0001], 0039H 
        JA ERROR;verificacion si es mayor a 57 en ascii
        CMP TextoIngresado[0002], 0030H
        JB ERROR;verificacion de si es menor al codigo 48 en ascii 
        CMP TextoIngresado[0002], 0039H
        JA ERROR;verificacion si es mayor a 57 en ascii
        CMP TextoIngresado[0003], '$'
        JNE ERROR;verificacion si se ingresaron solo 2 digitos
        SUB TextoIngresado[0001], 0030H ;para convertir a decimal el digito de decena
        SUB TextoIngresado[0002], 0030H ; para convertir a decimal el digito de la unidad
        JMP SALIR2

    SinSigno:
        CMP TextoIngresado[0000], 0039H 
        JA ERROR ;verificacion si es mayor a 57 en ascii
        CMP TextoIngresado[0000], 0030H 
        JB ERROR ;verificacion de si es menor al codigo 48 en ascii 
        CMP TextoIngresado[0001], 0039H
        JA ERROR ;verificacion si es mayor a 57 en ascii
        CMP TextoIngresado[0001], 0030H
        JB ERROR ;verificacion de si es menor al codigo 48 en ascii 
        CMP TextoIngresado[0002], '$'
        JNE ERROR ;verificacion si se ingresaron solo 2 digitos

        ;proceso para agregar signo al texto usuario

        MOV AL, TextoIngresado[0000] ; copiamos el digito 
        MOV TextoIngresado[0000], 002BH ;cambiamos el digitio por el signo mas
        MOV Ah, TextoIngresado[0001] ; copiamos el segundo digito
        MOV TextoIngresado[0001], AL ; movemos el primer digito a la pos 1
        MOV TextoIngresado[0002], AH ; movemos el segundo digito a la pos 2
        SUB TextoIngresado[0001], 0030H ; convertimos a decimal
        SUB TextoIngresado[0002], 0030H ; convertimos a decimal

        JMP SALIR2

    ERROR:
        limpiarpantalla
        imprimir asteriscos
        imprimir mensajeError
        imprimir asteriscos
        imprimir salto
        jmp MENU2
    
    SALIR2:


    pop_automatico
ENDM




salir MACRO
    imprimir mensajeSalida
    MOV AX, 4C00H ; Interrupcion para finalizar el programa
    INT 21H ; Llama a la interrupcion
ENDM

derivar MACRO
    push_automatico

    ;derivar coeficiente 5 y guardarlo en derivada 4
    
    xor AX,AX ;reiniciamos el registro ax 
    mov al,10D ; valor necesario para multiplicar la decena de la funcion original
    mul Original5[0001] ;multiplicacion de la decena por 10 
    xor BX,BX; reiniciamos bx
    mov bl,Original5[0002] ;obtenemos el digito de unidad
    add al,bl; sumamos las decenas con las unidades
    mov bl,5D ;realizamos la multiplicacion de la derivada
    mul bl 
    mov bl,10D ;valor para obtener las decenas 
    div bl ; realizamos la division y guardamos en ax --- AL el digito decena --- AH digito Unidad
    mov Derivada4[0001], AL ;guardamos la decena
	mov Derivada4[0002], AH ;guardamos la unidad
    mov ah,Original5[0000] ;copiamos el signo 
    mov Derivada4[0000],ah

    ;derivar coeficiente 4 y guardarlo en derivada 3
    
    xor AX,AX ;reiniciamos el registro ax 
    mov al,10D ; valor necesario para multiplicar la decena de la funcion original
    mul Original4[0001] ;multiplicacion de la decena por 10 
    xor BX,BX; reiniciamos bx
    mov bl,Original4[0002] ;obtenemos el digito de unidad
    add al,bl; sumamos las decenas con las unidades
    mov bl,4D ;realizamos la multiplicacion de la derivada
    mul bl 
    mov bl,10D ;valor para obtener las decenas 
    div bl ; realizamos la division y guardamos en ax --- AL el digito decena --- AH digito Unidad
    mov Derivada3[0001], AL ;guardamos la decena
	mov Derivada3[0002], AH ;guardamos la unidad
    mov ah,Original4[0000] ;copiamos el signo 
    mov Derivada3[0000],ah

    ;derivar coeficiente 3 y guardarlo en derivada 2
    
    xor AX,AX ;reiniciamos el registro ax 
    mov al,10D ; valor necesario para multiplicar la decena de la funcion original
    mul Original3[0001] ;multiplicacion de la decena por 10 
    xor BX,BX; reiniciamos bx
    mov bl,Original3[0002] ;obtenemos el digito de unidad
    add al,bl; sumamos las decenas con las unidades
    mov bl,3D ;realizamos la multiplicacion de la derivada
    mul bl 
    mov bl,10D ;valor para obtener las decenas 
    div bl ; realizamos la division y guardamos en ax --- AL el digito decena --- AH digito Unidad
    mov Derivada2[0001], AL ;guardamos la decena
	mov Derivada2[0002], AH ;guardamos la unidad
    mov ah,Original3[0000] ;copiamos el signo 
    mov Derivada2[0000],ah

    ;derivar coeficiente 2 y guardarlo en derivada 1
    
    xor AX,AX ;reiniciamos el registro ax 
    mov al,10D ; valor necesario para multiplicar la decena de la funcion original
    mul Original2[0001] ;multiplicacion de la decena por 10 
    xor BX,BX; reiniciamos bx
    mov bl,Original2[0002] ;obtenemos el digito de unidad
    add al,bl; sumamos las decenas con las unidades
    mov bl,2D ;realizamos la multiplicacion de la derivada
    mul bl 
    mov bl,10D ;valor para obtener las decenas 
    div bl ; realizamos la division y guardamos en ax --- AL el digito decena --- AH digito Unidad
    mov Derivada1[0001], AL ;guardamos la decena
	mov Derivada1[0002], AH ;guardamos la unidad
    mov ah,Original2[0000] ;copiamos el signo 
    mov Derivada1[0000],ah

     ;derivar coeficiente 1 y guardarlo en derivada 0
    
    mov ah,Original1[0000] ;copiamos el signo 
    mov Derivada0[0000],ah
    mov ah,Original1[0001] ;copiamos el signo 
    mov Derivada0[0001],ah
    mov ah,Original1[0002] ;copiamos el signo 
    mov Derivada0[0002],ah

    xor AX,AX ;reiniciamos registro AX
    xor BX,BX ;reiniciamos registro BX

    pop_automatico
ENDM


integrar MACRO
    push_automatico
    
    
    ;Integrar coeficiente 5 y guardarlo en Integral 6
    
    xor AX,AX ;reiniciamos el registro ax 
    mov al,10D ; valor necesario para multiplicar la decena de la funcion original
    mul Original5[0001] ;multiplicacion de la decena por 10 
    xor BX,BX; reiniciamos bx
    mov bl,Original5[0002] ;obtenemos el digito de unidad
    add al,bl; sumamos las decenas con las unidades
    mov bl,6D ;realizamos la division de la integral
    div bl ; esta division se guarda en AX--- AH parte para decimales----AL parte para enteros
    xor ah,ah ;reiniciamos ah ya que contiene parte decimal que no interesa
    mov bl,10D ;valor para obtener las decenas 
    div bl ; realizamos la division y guardamos en ax --- AL el digito decena --- AH digito Unidad
    mov Integrada6[0001], AL ;guardamos la decena
	mov Integrada6[0002], AH ;guardamos la unidad
    mov ah,Original5[0000] ;copiamos el signo 
    mov Integrada6[0000],ah

    ;Integrar coeficiente 4 y guardarlo en Integral 5
    
    xor AX,AX ;reiniciamos el registro ax 
    mov al,10D ; valor necesario para multiplicar la decena de la funcion original
    mul Original4[0001] ;multiplicacion de la decena por 10 
    xor BX,BX; reiniciamos bx
    mov bl,Original4[0002] ;obtenemos el digito de unidad
    add al,bl; sumamos las decenas con las unidades
    mov bl,5D ;realizamos la division de la integral
    div bl ; esta division se guarda en AX--- AH parte para decimales----AL parte para enteros
    xor ah,ah ;reiniciamos ah ya que contiene parte decimal que no interesa
    mov bl,10D ;valor para obtener las decenas 
    div bl ; realizamos la division y guardamos en ax --- AL el digito decena --- AH digito Unidad
    mov Integrada5[0001], AL ;guardamos la decena
	mov Integrada5[0002], AH ;guardamos la unidad
    mov ah,Original4[0000] ;copiamos el signo 
    mov Integrada5[0000],ah

    ;Integrar coeficiente 3 y guardarlo en Integral 4
    
    xor AX,AX ;reiniciamos el registro ax 
    mov al,10D ; valor necesario para multiplicar la decena de la funcion original
    mul Original3[0001] ;multiplicacion de la decena por 10 
    xor BX,BX; reiniciamos bx
    mov bl,Original3[0002] ;obtenemos el digito de unidad
    add al,bl; sumamos las decenas con las unidades
    mov bl,4D ;realizamos la division de la integral
    div bl ; esta division se guarda en AX--- AH parte para decimales----AL parte para enteros
    xor ah,ah ;reiniciamos ah ya que contiene parte decimal que no interesa
    mov bl,10D ;valor para obtener las decenas 
    div bl ; realizamos la division y guardamos en ax --- AL el digito decena --- AH digito Unidad
    mov Integrada4[0001], AL ;guardamos la decena
	mov Integrada4[0002], AH ;guardamos la unidad
    mov ah,Original3[0000] ;copiamos el signo 
    mov Integrada4[0000],ah

    ;Integrar coeficiente 2 y guardarlo en Integral 3
    
    xor AX,AX ;reiniciamos el registro ax 
    mov al,10D ; valor necesario para multiplicar la decena de la funcion original
    mul Original2[0001] ;multiplicacion de la decena por 10 
    xor BX,BX; reiniciamos bx
    mov bl,Original2[0002] ;obtenemos el digito de unidad
    add al,bl; sumamos las decenas con las unidades
    mov bl,3D ;realizamos la division de la integral
    div bl ; esta division se guarda en AX--- AH parte para decimales----AL parte para enteros
    xor ah,ah ;reiniciamos ah ya que contiene parte decimal que no interesa
    mov bl,10D ;valor para obtener las decenas 
    div bl ; realizamos la division y guardamos en ax --- AL el digito decena --- AH digito Unidad
    mov Integrada3[0001], AL ;guardamos la decena
	mov Integrada3[0002], AH ;guardamos la unidad
    mov ah,Original2[0000] ;copiamos el signo 
    mov Integrada3[0000],ah

    ;Integrar coeficiente 1 y guardarlo en Integral 2
    
    xor AX,AX ;reiniciamos el registro ax 
    mov al,10D ; valor necesario para multiplicar la decena de la funcion original
    mul Original1[0001] ;multiplicacion de la decena por 10 
    xor BX,BX; reiniciamos bx
    mov bl,Original1[0002] ;obtenemos el digito de unidad
    add al,bl; sumamos las decenas con las unidades
    mov bl,2D ;realizamos la division de la integral
    div bl ; esta division se guarda en AX--- AH parte para decimales----AL parte para enteros
    xor ah,ah ;reiniciamos ah ya que contiene parte decimal que no interesa
    mov bl,10D ;valor para obtener las decenas 
    div bl ; realizamos la division y guardamos en ax --- AL el digito decena --- AH digito Unidad
    mov Integrada2[0001], AL ;guardamos la decena
	mov Integrada2[0002], AH ;guardamos la unidad
    mov ah,Original1[0000] ;copiamos el signo 
    mov Integrada2[0000],ah

    ;Integrar coeficiente 0 y guardarlo en Integral 1
    
    mov ah,Original0[0000] ;copiamos el signo 
    mov Integrada1[0000],ah
    mov ah,Original0[0001] ;copiamos las decenas 
    mov Integrada1[0001],ah
    mov ah,Original0[0002] ;copiamos las unidades 
    mov Integrada1[0002],ah


    xor AX,AX ;reiniciamos registro AX
    xor BX,BX ;reiniciamos registro BX
    pop_automatico
ENDM

.MODEL small ; Utiliza un espacio 'medium' de almacenamiento

;-------------------AREA DE STACK------------------------
.STACK
;-------------------AREA DE STACK------------------------


;-----------------AREA DE DATA-----------------------------
.DATA
    ;------------------------MENSAJES A MOSTRAR------------------------------------
    ;nota los 0AH y 0DH son para nueva linea y retorno del carro
    encabezado    DB 0AH,0DH,' UNIVERSIDAD DE SAN CARLOS DE GUATEMALA',0AH,0DH,' FACULTAD DE INGENIERIA',0AH,0DH,' ESCUELA DE CIENCIAS Y SISTEMAS',0AH,0DH,' ARQUITECTURA DE COMPUTADORES Y ENSAMBLADORES 1 N',0AH,0DH, ' Practica 1 Assembler', '$'
    MenuPrincipal DB 0AH, 0DH,0AH, 0DH,' Ingrese el numero de la opcion que desea:',0AH,0DH,' 1) Ingresar los coeficientes de la funcion', 0AH, 0DH,' 2) Imprimir la funcion almacenada',0AH,0DH,' 3) Imprimir derivada de la funcion almacenada',0AH,0DH,' 4) Imprimir antiderivada de la funcion almacenada',0AH,0DH,' 5) Graficar Funcion',0AH,0DH,' 6) Metodo de Newton',0AH,0DH,' 7) Metodo Steffensen',0AH,0DH,' 8) Salir',0AH,0DH,' ','$'
    Erroropcion DB 0AH,0DH,'******************************************************',0AH,0DH,' INGRESO UNA OPCION NO EXISTENTE, VUELVA A INTENTARLO',0AH,0DH,'******************************************************',0AH,0DH,'$'
    SolicitarCoeficiente5 DB 0AH, 0DH, ' - Ingrese el coeficiente de x^5: ', '$'
    SolicitarCoeficiente4 DB 0AH, 0DH, ' - Ingrese el coeficiente de x^4: ', '$'
    SolicitarCoeficiente3 DB 0AH, 0DH, ' - Ingrese el coeficiente de x^3: ', '$'
    SolicitarCoeficiente2 DB 0AH, 0DH, ' - Ingrese el coeficiente de x^2: ', '$'
    SolicitarCoeficiente1 DB 0AH, 0DH, ' - Ingrese el coeficiente de x^1: ', '$'
    SolicitarCoeficiente0 DB 0AH, 0DH, ' - Ingrese el coeficiente del termino independiente: ', '$'

    asteriscos DB 0AH,0DH,'**********************************************************************','$'
    iguales DB 0AH,0DH, '========================================================================','$'
    salto DB 0AH,0DH,'$'
    opcionNoFuncional DB 0AH,0DH,' Opcion aun no funcional','$'
    correctoIngreso DB 0AH,0DH,' Funcion guardada con exito','$'
    mensajeSalida DB 0AH,0DH,' Ejecucion terminada con exito.....','$'
    mensajeError DB 0AH, 0DH, ' - Coeficiente ingresado no valido, solo se permiten numeros enteros', '$'
    errorExisteFuncion DB 0AH, 0DH, ' - No existe funcion, por favor ingrese una funcion ', '$'
    ;------------------------Variables para guardar funcion original--------------------------
    Original5 DB 002BH, 0000, 0000, '$' ; primera posicion signo, segunda posicion decena y tercera es unidad
	Original4 DB 002BH, 0000, 0000,  '$' 
	Original3 DB 002BH, 0000, 0000,  '$' 
	Original2 DB 002BH, 0000, 0000,  '$' 
	Original1 DB 002BH, 0000, 0000,  '$'
    Original0 DB 002BH, 0000, 0000,  '$'

    Temporal5 DB 002BH, 0000, 0000, '$' ; primera posicion signo, segunda posicion decena y tercera es unidad
	Temporal4 DB 002BH, 0000, 0000,  '$' 
	Temporal3 DB 002BH, 0000, 0000,  '$' 
	Temporal2 DB 002BH, 0000, 0000,  '$' 
	Temporal1 DB 002BH, 0000, 0000,  '$'
    Temporal0 DB 002BH, 0000, 0000,  '$'

    ;------------------------Variables para guardar funcion derivada--------------------------
	Derivada4 DB 002BH, 0000, 0000,  '$' ; primera posicion signo, segunda posicion decena y tercera es unidad
	Derivada3 DB 002BH, 0000, 0000,  '$' 
	Derivada2 DB 002BH, 0000, 0000,  '$' 
	Derivada1 DB 002BH, 0000, 0000,  '$'
    Derivada0 DB 002BH, 0000, 0000,  '$'

    ;------------------------Variables para guardar funcion integrada--------------------------
	Integrada6 DB 002BH, 0000, 0000,  '$' ; primera posicion signo, segunda posicion decena y tercera es unidad
	Integrada5 DB 002BH, 0000, 0000,  '$' 
	Integrada4 DB 002BH, 0000, 0000,  '$' 
	Integrada3 DB 002BH, 0000, 0000,  '$'
    Integrada2 DB 002BH, 0000, 0000,  '$'
    Integrada1 DB 002BH, 0000, 0000,  '$'

    ;------------------------Variables para funcionamiento general--------------------------
    TextoIngresado DB 15 dup('$') ;guardara el texto cuando se ingresan los coeficientes
    ;textos para la impresion de funciones
    equis6 DB 'x^6 ', '$'
    equis5 DB 'x^5 ', '$'
    equis4 DB 'x^4 ', '$'
    equis3 DB 'x^3 ', '$'
    equis2 DB 'x^2 ', '$'
    equis1 DB 'x^1 ', '$'
    masC DB '+C ', '$'
    InicioFuncionOriginal DB 0AH, 0DH,09H,'f(x) = ', '$'
    InicioFuncionDerivada DB 0AH, 0DH,09H,'f''(x) = ', '$'
    InicioFuncionIntegrada DB 0AH, 0DH,09H,'F(x) = ', '$'
    existeFuncion DB 00H ;bandera de si existe funcion o no 
    ;--------------------------------AREA DE CODIGO----------------------------------------


.CODE
	
    main PROC

    ;-----------------------------MENU INICIAL-----------------------------
    MENU: 
        limpiarpantalla ;llamada a la macro de limpiar pantalla
    Menu2:
        imprimir encabezado       ; imprimir encabezado
        imprimir MenuPrincipal ; imprimir el menu
        obteneropcion ; Captura la tecla presionada

        CMP AL, 49D ; codigo ascii de 1
        JE OPCION1 ;MOSTRAR FUNCION ORIGINAL
        CMP AL, 50D ; codigo ascii de 2
        JE OPCION2 ;MOSTRAR FUNCION DERIVADA
        CMP AL, 51D ; codigo ascii de 3
        JE OPCION3 ;MOSTRAR FUNCION INTEGRADA
        CMP AL, 52D ; codigo ascii de 4
        JE OPCION4 ;MOSTRAR FUNCION INTEGRADA
        CMP AL, 53D ; codigo ascii de 5
        JE OPCION5 ; GRAFICAR
        CMP AL, 54D ; codigo ascii de 6
        JE OPCION6 ; METODO 1 NEWTON
        CMP AL, 55D ; codigo ascii de 7
        JE OPCION7 ;METODO 2 STEFFENSEN
        CMP AL, 56D ; codigo ascii de 8
        JE OPCION8 ; SALIR

        limpiarpantalla ;en caso de error para dejar el mensaje 
        Imprimir Erroropcion
        imprimir salto
        JMP MENU2 ; Si el caracter no es un numero entre [1,8] regresa al menu

    ;-----------------------------MENU INICIAL-----------------------------
    OPCION1:
        JMP INGRESARFUNCION
    OPCION2:
        JMP MostrarOriginal
    OPCION3:
        JMP MostrarDerivada
    OPCION4:
        JMP MostrarIntegrada
    OPCION5:
        JMP Temporal
    OPCION6:
        JMP Temporal
    OPCION7:
        JMP Temporal
    OPCION8: 
        JMP CERRAR
    ;----------------------------------SALIR------------------------------------
    CERRAR:
        salir
    ;----------------------------------SALIR------------------------------------

    ;----------------------------------Ingreso de Funcion------------------------------------
    INGRESARFUNCION:
        push_automatico
        limpiarpantalla
        reiniciarTemporales
        imprimir SolicitarCoeficiente5
        leerValorCoeficiente
        

        ;solicitud del coeficiente 5
        xor AL,AL ; reiniciamos el registro al 
        mov AL,TextoIngresado[0000];movemos la primer posicion al AL del texto ingresado
        mov Temporal5[0000],AL ; lo ingresamos en la primera pos de la variable original
        mov AL,TextoIngresado[0001];movemos la segunda posicion al AL del texto ingresado
        mov Temporal5[0001],AL ; lo ingresamos en la segunda pos de la variable original
        mov AL,TextoIngresado[0002];movemos la tercera posicion al AL del texto ingresado
        mov Temporal5[0002],AL ; lo ingresamos en la tercera pos de la variable original

        ;solicitud del coeficiente 4
        imprimir SolicitarCoeficiente4
        leerValorCoeficiente

        xor AL,AL ; reiniciamos el registro al 
        mov AL,TextoIngresado[0000];movemos la primer posicion al AL del texto ingresado
        mov Temporal4[0000],AL ; lo ingresamos en la primera pos de la variable original
        mov AL,TextoIngresado[0001];movemos la segunda posicion al AL del texto ingresado
        mov Temporal4[0001],AL ; lo ingresamos en la segunda pos de la variable original
        mov AL,TextoIngresado[0002];movemos la tercera posicion al AL del texto ingresado
        mov Temporal4[0002],AL ; lo ingresamos en la tercera pos de la variable original

        ;solicitud del coeficiente 3
        imprimir SolicitarCoeficiente3
        leerValorCoeficiente

        xor AL,AL ; reiniciamos el registro al 
        mov AL,TextoIngresado[0000];movemos la primer posicion al AL del texto ingresado
        mov Temporal3[0000],AL ; lo ingresamos en la primera pos de la variable original
        mov AL,TextoIngresado[0001];movemos la segunda posicion al AL del texto ingresado
        mov Temporal3[0001],AL ; lo ingresamos en la segunda pos de la variable original
        mov AL,TextoIngresado[0002];movemos la tercera posicion al AL del texto ingresado
        mov Temporal3[0002],AL ; lo ingresamos en la tercera pos de la variable original

        ;solicitud del coeficiente 2
        imprimir SolicitarCoeficiente2
        leerValorCoeficiente

        xor AL,AL ; reiniciamos el registro al 
        mov AL,TextoIngresado[0000];movemos la primer posicion al AL del texto ingresado
        mov Temporal2[0000],AL ; lo ingresamos en la primera pos de la variable original
        mov AL,TextoIngresado[0001];movemos la segunda posicion al AL del texto ingresado
        mov Temporal2[0001],AL ; lo ingresamos en la segunda pos de la variable original
        mov AL,TextoIngresado[0002];movemos la tercera posicion al AL del texto ingresado
        mov Temporal2[0002],AL ; lo ingresamos en la tercera pos de la variable original

        ;solicitud del coeficiente 1
        imprimir SolicitarCoeficiente1
        leerValorCoeficiente

        xor AL,AL ; reiniciamos el registro al 
        mov AL,TextoIngresado[0000];movemos la primer posicion al AL del texto ingresado
        mov Temporal1[0000],AL ; lo ingresamos en la primera pos de la variable original
        mov AL,TextoIngresado[0001];movemos la segunda posicion al AL del texto ingresado
        mov Temporal1[0001],AL ; lo ingresamos en la segunda pos de la variable original
        mov AL,TextoIngresado[0002];movemos la tercera posicion al AL del texto ingresado
        mov Temporal1[0002],AL ; lo ingresamos en la tercera pos de la variable original

        ;solicitud del termino independiente
        imprimir SolicitarCoeficiente0
        leerValorCoeficiente

        xor AL,AL ; reiniciamos el registro al 
        mov AL,TextoIngresado[0000];movemos la primer posicion al AL del texto ingresado
        mov Temporal0[0000],AL ; lo ingresamos en la primera pos de la variable original
        mov AL,TextoIngresado[0001];movemos la segunda posicion al AL del texto ingresado
        mov Temporal0[0001],AL ; lo ingresamos en la segunda pos de la variable original
        mov AL,TextoIngresado[0002];movemos la tercera posicion al AL del texto ingresado
        mov Temporal0[0002],AL ; lo ingresamos en la tercera pos de la variable original

        mov existeFuncion,01H ;activamos bandera de existe funcion ya que todo salio bien al ingreso
        
        reiniciarFuncion
        ; procedemos a copiar los temporales a las variables originales
        
        ;para coeficiente 5
        XOR AX,AX
        mov AL,Temporal5[0000];movemos la primer posicion al AL del texto ingresado
        mov Original5[0000],AL ; lo ingresamos en la primera pos de la variable original
        mov AL,Temporal5[0001];movemos la segunda posicion al AL del texto ingresado
        mov Original5[0001],AL ; lo ingresamos en la segunda pos de la variable original
        mov AL,Temporal5[0002];movemos la tercera posicion al AL del texto ingresado
        mov Original5[0002],AL ; lo ingresamos en la tercera pos de la variable original

        ;para coeficiente 4
        XOR AX,AX
        mov AL,Temporal4[0000];movemos la primer posicion al AL del texto ingresado
        mov Original4[0000],AL ; lo ingresamos en la primera pos de la variable original
        mov AL,Temporal4[0001];movemos la segunda posicion al AL del texto ingresado
        mov Original4[0001],AL ; lo ingresamos en la segunda pos de la variable original
        mov AL,Temporal4[0002];movemos la tercera posicion al AL del texto ingresado
        mov Original4[0002],AL ; lo ingresamos en la tercera pos de la variable original

        ;para coeficiente 3
        XOR AX,AX
        mov AL,Temporal3[0000];movemos la primer posicion al AL del texto ingresado
        mov Original3[0000],AL ; lo ingresamos en la primera pos de la variable original
        mov AL,Temporal3[0001];movemos la segunda posicion al AL del texto ingresado
        mov Original3[0001],AL ; lo ingresamos en la segunda pos de la variable original
        mov AL,Temporal3[0002];movemos la tercera posicion al AL del texto ingresado
        mov Original3[0002],AL ; lo ingresamos en la tercera pos de la variable original

        ;para coeficiente 2
        XOR AX,AX
        mov AL,Temporal2[0000];movemos la primer posicion al AL del texto ingresado
        mov Original2[0000],AL ; lo ingresamos en la primera pos de la variable original
        mov AL,Temporal2[0001];movemos la segunda posicion al AL del texto ingresado
        mov Original2[0001],AL ; lo ingresamos en la segunda pos de la variable original
        mov AL,Temporal2[0002];movemos la tercera posicion al AL del texto ingresado
        mov Original2[0002],AL ; lo ingresamos en la tercera pos de la variable original

        ;para coeficiente 1
        XOR AX,AX
        mov AL,Temporal1[0000];movemos la primer posicion al AL del texto ingresado
        mov Original1[0000],AL ; lo ingresamos en la primera pos de la variable original
        mov AL,Temporal1[0001];movemos la segunda posicion al AL del texto ingresado
        mov Original1[0001],AL ; lo ingresamos en la segunda pos de la variable original
        mov AL,Temporal1[0002];movemos la tercera posicion al AL del texto ingresado
        mov Original1[0002],AL ; lo ingresamos en la tercera pos de la variable original

        ;para coeficiente 0
        XOR AX,AX
        mov AL,Temporal0[0000];movemos la primer posicion al AL del texto ingresado
        mov Original0[0000],AL ; lo ingresamos en la primera pos de la variable original
        mov AL,Temporal0[0001];movemos la segunda posicion al AL del texto ingresado
        mov Original0[0001],AL ; lo ingresamos en la segunda pos de la variable original
        mov AL,Temporal0[0002];movemos la tercera posicion al AL del texto ingresado
        mov Original0[0002],AL ; lo ingresamos en la tercera pos de la variable original
        
        derivar
        integrar
        pop_automatico
        limpiarpantalla
        imprimir asteriscos
        imprimir correctoIngreso
        imprimir asteriscos
        imprimir salto
        jmp MENU2
    ;----------------------------------Ingreso de Funcion------------------------------------
	
    ;---------------------------Impresion de Funcion Almacenada------------------------------
    MostrarOriginal:
        limpiarpantalla
        imprimirOriginal
    ;---------------------------Impresion de Funcion Almacenada------------------------------

    ;---------------------------Impresion de Funcion Derivada------------------------------
    MostrarDerivada:
        limpiarpantalla
        imprimirDerivada
    ;---------------------------Impresion de Funcion Derivada------------------------------

    ;---------------------------Impresion de Funcion Integrada------------------------------
    MostrarIntegrada:
        limpiarpantalla
        imprimirIntegral
    ;---------------------------Impresion de Funcion Integrada------------------------------

    Temporal:
        limpiarpantalla
        imprimir asteriscos
        imprimir opcionNoFuncional
        imprimir asteriscos
        imprimir salto
        jmp Menu2
    
    .exit
    main ENDP

END	main