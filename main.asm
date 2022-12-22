
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
    mov bh,3fh ; 3= COLOR CIAN Y F COLOR BLANCO EN LAS LETRAS
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
    MOV             AX, @data            ;obtenemos la data
    MOV             DS, AX               ;pasamos el registro AX al DS
    MOV             AH, 09H              ;creamos la interrupcion
    MOV             DX, offset cadena    ;obtenemos la direccion de memoria de cadena
    INT             21H                  ; ejecutamos la interrupcion
    pop_automatico
ENDM

imprimirOriginal MACRO
    add Original5[0001],30H ; regresamos el valor a codigo ascii para poder imprimir
    add Original5[0002],30H ; regresamos el valor a codigo ascii para poder imprimir

    imprimir InicioFuncionOriginal
    imprimir Original5
    imprimir equis5
    

    sub Original5[0001],30H ; regresamos el valor a decimal
    sub Original5[0002],30H ; regresamos el valor a decimal

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

leerValorCoeficiente MACRO
    LOCAL SIGUIENTE,CICLO,SALIR1,SIGNO,POSITIVO,SALIR2,ERROR ; DECLARAMOS QUE ESTAS ETIQUETAS SON SOLO EN ESTA MACRO
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
        JE SIGNO ;saltamos para analizar con signo
        CMP TextoIngresado[0000], 002DH;verificamos que el usuario haya ingresado signo -
        JE SIGNO;saltamos para analizar con signo
        JMP POSITIVO;si no se encuentra con signo se dejara el inicial del arreglo que se declaro al inicio

    SIGNO:
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

    POSITIVO:
        CMP TextoIngresado[0000], 0030H 
        JB ERROR ;verificacion de si es menor al codigo 48 en ascii 
        CMP TextoIngresado[0000], 0039H 
        JA ERROR ;verificacion si es mayor a 57 en ascii
        CMP TextoIngresado[0001], 0030H
        JB ERROR ;verificacion de si es menor al codigo 48 en ascii 
        CMP TextoIngresado[0001], 0039H
        JA ERROR ;verificacion si es mayor a 57 en ascii
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
        imprimir mensajeError
        jmp MENU2
    
    SALIR2:


    pop_automatico
ENDM




salir MACRO
    MOV AX, 4C00H ; Interrupcion para finalizar el programa
    INT 21H ; Llama a la interrupcion
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
    MenuPrincipal DB 0AH, 0DH,0AH, 0DH,' Ingrese el numero de la opcion que desea:',0AH,0DH,' 1) Ingresar los coeficientes de la funcion', 0AH, 0DH,' 2) Imprimir la funcion almacenada',0AH,0DH,' 3) Imprimir derivada de la funcion almacenada',0AH,0DH,' 4) Imprimir antiderivada de la funcion almacenada',0AH,0DH,' 5) Graficar Funcion',0AH,0DH,' 6) Metodo de Newton',0AH,0DH,' 7) Metodo Steffensen',0AH,0DH,' 8) Metodo Muller',0AH,0DH,' 9) Salir',0AH,0DH,' ','$'
    Erroropcion DB 0AH,0DH,'******************************************************',0AH,0DH,' INGRESO UNA OPCION NO EXISTENTE, VUELVA A INTENTARLO',0AH,0DH,'******************************************************',0AH,0DH,'$'
    SolicitarCoeficiente5 DB 0AH, 0DH, ' - Ingrese el coeficiente de x^5: ', '$'
    SolicitarCoeficiente4 DB 0AH, 0DH, ' - Ingrese el coeficiente de x^4: ', '$'
    SolicitarCoeficiente3 DB 0AH, 0DH, ' - Ingrese el coeficiente de x^3: ', '$'
    SolicitarCoeficiente2 DB 0AH, 0DH, ' - Ingrese el coeficiente de x^2: ', '$'
    SolicitarCoeficiente1 DB 0AH, 0DH, ' - Ingrese el coeficiente de x^1: ', '$'
    SolicitarCoeficiente0 DB 0AH, 0DH, ' - Ingrese el coeficiente del termino independiente: ', '$'

    mensajeError DB 0AH, 0DH, ' - Coeficiente ingresado no valido ', '$'
    ;------------------------Variables para guardar funcion original--------------------------
    Original5 DB 002BH, 0000, 0000, '$' ; primera posicion signo, segunda posicion decena y tercera es unidad
	Original4 DB 002BH, 0000, 0000,  '$' 
	Original3 DB 002BH, 0000, 0000,  '$' 
	Original2 DB 002BH, 0000, 0000,  '$' 
	Original1 DB 002BH, 0000, 0000,  '$'
    Original0 DB 002BH, 0000, 0000,  '$'

    ;------------------------Variables para funcionamiento general--------------------------
    TextoIngresado DB 15 dup('$')
    equis5 DB 'x^5', '$'
    InicioFuncionOriginal DB 0AH, 0DH, '	f(x) = ', '$'

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
        JE OPCION1
        CMP AL, 50D ; codigo ascii de 2
        JE OPCION2 ;MOSTRAR FUNCION GUARDADA
        CMP AL, 57D ; codigo ascii de 9
        JE OPCION9 ; Salir

        limpiarpantalla ;en caso de error para dejar el mensaje 
        Imprimir Erroropcion
        JMP MENU2 ; Si el caracter no es un numero entre [1,8] regresa al menu

    ;-----------------------------MENU INICIAL-----------------------------
    OPCION1:
        JMP INGRESARFUNCION
    OPCION2:
        JMP MostrarOriginal
    OPCION9: 
        JMP CERRAR
    ;----------------------------------SALIR------------------------------------
    CERRAR:
        salir
    ;----------------------------------SALIR------------------------------------

    ;----------------------------------Ingreso de Funcion------------------------------------
    INGRESARFUNCION:
        push_automatico
        limpiarpantalla
        reiniciarFuncion
        imprimir SolicitarCoeficiente5
        leerValorCoeficiente
        
        xor AL,AL ; reiniciamos el registro al 
        mov AL,TextoIngresado[0000];movemos la primer posicion al AL del texto ingresado
        mov Original5[0000],AL ; lo ingresamos en la primera pos de la variable original
        mov AL,TextoIngresado[0001];movemos la segunda posicion al AL del texto ingresado
        mov Original5[0001],AL ; lo ingresamos en la segunda pos de la variable original
        mov AL,TextoIngresado[0002];movemos la tercera posicion al AL del texto ingresado
        mov Original5[0002],AL ; lo ingresamos en la tercera pos de la variable original

        ; mov al,datoCoeficienteFuncion4[0001] ; tomamos la decena
        ; mov bl,10 ;guardamos 10 
        ; mul bl ; multiplicamos por 10 la decena 
        ; xor bx,bx ;borramos el registro bx
        ; mov bl,datoCoeficienteFuncion4[0002] ;preparamos el segundo digito de unidad
		; add al,bl; sumamos los dos registros 


        pop_automatico
        jmp MENU
    ;----------------------------------Ingreso de Funcion------------------------------------
	
    ;---------------------------Impresion de Funcion Almacenada------------------------------
    MostrarOriginal:
        limpiarpantalla
        imprimirOriginal
        jmp MENU2
    ;---------------------------Impresion de Funcion Almacenada------------------------------

    .exit
    main ENDP

END	main