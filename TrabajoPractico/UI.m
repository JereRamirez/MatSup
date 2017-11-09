 FuncionesLineal
 Parabola
 FuncionesExponencial
 funcionesHiperbolica
 FuncionesPotencial
 addpath(pwd);
                   
f = figure("deletefcn", "clear", "name", "TP Superior", "numbertitle", "off");
global listaX = [];
global listaY = [];
global decimal = 0;

botonAgregar = uicontrol (f, "string", "Agregar par de puntos", "position",[20 290 150 40], "callback", "agregar(inputX, inputY)");
botonDecimales = uicontrol (f, "string", "Agregar", "position",[470 250 50 40], "callback", "agregarDecimales(inputDecimales)");


botonLineal = uicontrol (f, "string", "Graficar lineal", "position",[20 200 150 40], "callback", "calcularLineal(inputX, inputY)");
botonParabola = uicontrol (f, "string", "Graficar parabola", "position",[20 160 150 40], "callback", "calcularParabola(inputX, inputY)");
botonExponencial = uicontrol (f, "string", "Graficar exponencial", "position",[20 120 150 40], "callback", "calcularExponencial(inputX, inputY)");
botonHiperbola = uicontrol (f, "string", "Graficar hiperbola", "position",[20 80 150 40], "callback", "calcularHiperbola(inputX, inputY)");
botonPotencial = uicontrol (f, "string", "Graficar potencial", "position",[20 40 150 40], "callback", "calcularPotencial(inputX, inputY)");

botonMostrarFuncionLineal = uicontrol (f, "string", "Mostrar función lineal", "position",[220 200 180 40], "callback", "mostrarFuncionLineal(linealX,linealY)");
botonMostrarFuncionParabola = uicontrol (f, "string", "Mostrar función parábola", "position",[220 160 180 40], "callback", "mostrarFuncionParabola(inputX, inputY)");
botonMostrarFuncionExponencial = uicontrol (f, "string", "Mostrar función exponencial", "position",[220 120 180 40], "callback", "mostrarFuncionExponencial(inputX, inputY)");
botonMostrarFuncionHiperbola = uicontrol (f, "string", "Mostrar función hiperbola", "position",[220 80 180 40], "callback", "mostrarFuncionHiperbola(inputX, inputY)");
botonMostrarFuncionPotencial = uicontrol (f, "string", "Mostrar función potencial", "position",[220 40 180 40], "callback", "mostrarFuncionPotencial(inputX, inputY)");

inputX = uicontrol (f, "style", "edit", "position",[40 350 150 40]);
inputY = uicontrol (f, "style", "edit", "position",[300 350 150 40]);
t2 = uicontrol (f, "style", "text", "string", "Y", "position",[270 350 20 40]);
t1 = uicontrol (f, "style", "text", "string", "X", "position",[10 350 20 40]);
t3 = uicontrol (f, "style", "text", "string", "Cantidad de decimales", "position",[270 300 200 40]);
inputDecimales = uicontrol (f, "style", "edit", "position",[470 300 50 40]);
function agregar(eX, eY)
  global listaX;
  global listaY;
  listaX(length(listaX) + 1) = str2double(get(eX, "string"));
  listaY(length(listaY) + 1) = str2double(get(eY, "string"));  
end

function agregarDecimales(inputN)
  global decimal
  decimal = str2double(get(inputN, "string"));
end

function calcularLineal()
  global listaX;
  global listaY;
  global linealX;
  global linealY;
  global decimal;
  coeficientesLineal = lineal(sumaVector(listaX), sumaVector(listaY), sumaCuadradosVector(listaX), sumaVectorProductoXY(listaX, listaY), length(listaX),decimal);
  linealX = coeficientesLineal(1);
  linealY = coeficientesLineal(2);
  printf("Y = %dX + %d\n", coeficientesLineal(1),coeficientesLineal(2));
  graficarLineal(listaX(1), listaX(length(listaX)), coeficientesLineal(1), coeficientesLineal(2));
  end
  
function mostrarFuncionLineal()
mostrarLineal(linealX,linealY);
end %no anda y ni idea

function calcularParabola()
  global listaX;
  global listaY;
  global decimal;
  coeficientesParabola = parabola(length(listaX),sumaVector(listaX),sumaVector(listaY),sumaCuadradosVector(listaX),sumaCuboVector(listaX),sumaCuartaVector(listaX),sumaVectorProductoXY(listaX,listaY),sumaVectorProductoX2Y(listaX,listaY),decimal)
  printf("Y = %dX^2+ %dX + %d\n", coeficientesParabola(1),coeficientesParabola(2), coeficientesParabola(3));
  graficarParabola(0, listaX(length(listaX)), coeficientesParabola(1),coeficientesParabola(2),coeficientesParabola(3));
  end


 function calcularExponencial()
  global listaX;
  global listaY;
  global decimal;
  coeficientesExponencial = exponencial(length(listaX),sumaVector(listaX),sumaVector(listaY),sumaVector(listaX),sumaLogaritmo(listaY),sumaCuadradosVector(listaX),sumaVectorProductoXLnY(listaX,listaY),decimal)
  printf("Y = %d * e^(%dx)\n", coeficientesExponencial(2),coeficientesExponencial(1));
  graficarExponencial(0, listaX(length(listaX)), coeficientesExponencial(1),coeficientesExponencial(2));
    
 end
 

 function calcularHiperbola()
  global listaX;
  global listaY;
  global decimal;
  coeficientesHiperbola = hiperbolica(length(listaX),sumaVector(listaX),sumaVector(listaY),sumaVector1X(listaX),sumaVector1X(listaY),sumaCuadrados1XVector(listaX),sumaVectorProducto1X1Y(listaX,listaY),decimal)
  printf("Y = %d  / (%d+X)\n", coeficientesHiperbola(1),coeficientesHiperbola(2));
  graficarHiperbolica(0, listaX(length(listaX)), coeficientesHiperbola(1),coeficientesHiperbola(2));
    
 end
 
 function calcularPotencial()
  global listaX;
  global listaY;
  global decimal;
  coeficientesPotencial = potencial(sumaLogaritmo(listaX),sumaLogaritmo(listaY),sumaLogaritmoCuadrado(listaX),sumaVectorProductoLnXLnY(listaX,listaY),length(listaX),decimal)
  printf("Y = %dx^(%dX)\n", coeficientesPotencial(2),coeficientesPotencial(1));
  graficarExponencial(0, listaX(length(listaX)), coeficientesPotencial(1),coeficientesPotencial(2));
    
 end
 
 
function suma = sumaVector(v)
  suma = 0;
  for i = 1:length(v)
     suma = suma + v(i);
  endfor  
end

function suma = sumaVector1X(v)
  suma = 0;
  for i = 1:length(v)
     suma = suma + (1/v(i));
  endfor  
end

function suma = sumaLogaritmo(v)
  suma = 0;
  for i = 1:length(v)
   suma = suma + log(v(i));
  endfor  
end

function suma = sumaCuadradosVector(v)
  suma = 0;
  for i = 1:length(v)
     suma = suma + v(i) * v(i);
  endfor  
end

function suma = sumaLogaritmoCuadrado(v)
  suma = 0;
   for i = 1:length(v)
     suma = suma + log(v(i)) * log(v(i));
  endfor  
end

function suma = sumaCuadrados1XVector(v)
  suma = 0;
  for i = 1:length(v)
     suma = suma + (1/v(i)) * (1/v(i));
  endfor  
end

function suma = sumaCuboVector(v)
   suma = 0;
   for i=1:length(v)
     suma = suma + v(i) * v(i) * v(i);
    endfor
end

function suma = sumaCuartaVector(v)
   suma = 0;
   for i=1:length(v)
     suma = suma + v(i) * v(i) * v(i)*v(i);
    endfor
end

function suma = sumaVectorProductoXY(v1, v2)
  suma = 0;
  for i = 1:length(v1)
     suma = suma + v1(i) * v2(i);
  endfor  
end

function suma = sumaVectorProducto1X1Y(v1,v2)
  suma = 0;
  for i = 1:length(v1)
     suma = suma + (1/v1(i)) * (1/v2(i));
  endfor  
end

function suma = sumaVectorProductoXLnY(v1, v2)
  suma = 0;
  for i = 1:length(v1)
     suma = suma + v1(i) * log(v2(i));
  endfor  
end

function suma = sumaVectorProductoLnXLnY(v1,v2)
   suma = 0;
  for i = 1:length(v1)
     suma = suma + log(v1(i)) * log(v2(i));
  endfor  
end

function suma = sumaVectorProductoX2Y(v1, v2)
  suma = 0;
  for i = 1:length(v1)
     suma = suma + (v1(i)* v1(i)) * v2(i);
  endfor  
end
