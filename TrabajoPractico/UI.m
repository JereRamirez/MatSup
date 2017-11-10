 FuncionesLineal
 Parabola
 FuncionesExponencial
 funcionesHiperbolica
 FuncionesPotencial
 TablaComparaciones
 addpath(pwd);
                   
f = figure("deletefcn", "clear", "name", "TP Superior", "numbertitle", "off", "position", [30 300 800 550]);
global listaX = [];
global listaY = [];
global decimal = 0;

botonAgregar = uicontrol (f, "string", "Agregar par de puntos", "position",[20 410 150 40], "callback", "agregar(inputX, inputY)");
botonDecimales = uicontrol (f, "string", "Agregar", "position",[700 410 50 40], "callback", "agregarDecimales(inputDecimales)");


botonLineal = uicontrol (f, "string", "Graficar lineal", "position",[20 320 150 40], "callback", "calcularLineal(inputX, inputY)");
botonParabola = uicontrol (f, "string", "Graficar parabola", "position",[20 280 150 40], "callback", "calcularParabola(inputX, inputY)");
botonExponencial = uicontrol (f, "string", "Graficar exponencial", "position",[20 240 150 40], "callback", "calcularExponencial(inputX, inputY)");
botonHiperbola = uicontrol (f, "string", "Graficar hiperbola", "position",[20 200 150 40], "callback", "calcularHiperbola(inputX, inputY)");
botonPotencial = uicontrol (f, "string", "Graficar potencial", "position",[20 160 150 40], "callback", "calcularPotencial(inputX, inputY)");

botonMostrarFuncionLineal = uicontrol (f, "string", "Mostrar función lineal", "position",[220 320 180 40], "callback", "mostrarFuncionLineal(inputX, inputY)");
botonMostrarFuncionParabola = uicontrol (f, "string", "Mostrar función parábola", "position",[220 280 180 40], "callback", "mostrarFuncionParabola(inputX, inputY)");
botonMostrarFuncionExponencial = uicontrol (f, "string", "Mostrar función exponencial", "position",[220 240 180 40], "callback", "mostrarFuncionExponencial(inputX, inputY)");
botonMostrarFuncionHiperbola = uicontrol (f, "string", "Mostrar función hiperbola", "position",[220 200 180 40], "callback", "mostrarFuncionHiperbola(inputX, inputY)");
botonMostrarFuncionPotencial = uicontrol (f, "string", "Mostrar función potencial", "position",[220 160 180 40], "callback", "mostrarFuncionPotencial(inputX, inputY)");

botonMostrarTablaComparativa = uicontrol (f, "string", "Mostrar tabla comparativa", "position",[20 80 180 40], "callback", "mostrarTablaComparativa(checkLineal, checkParabola, checkExponencial, checkHiperbolica, checkPotencial)");

checkLineal = uicontrol(f, "style", "checkbox", "string", "Lineal", "position", [250 80 70 40]);
checkParabola = uicontrol(f, "style", "checkbox", "string", "Parabola", "position", [330 80 70 40]);
checkExponencial = uicontrol(f, "style", "checkbox", "string", "Exponencial", "position", [410 80 90 40]);
checkHiperbolica = uicontrol(f, "style", "checkbox", "string", "Hiperbolica", "position", [520 80 90 40]);
checkPotencial= uicontrol(f, "style", "checkbox", "string", "Potencial", "position", [620 80 70 40]);

inputX = uicontrol (f, "style", "edit", "position",[40 470 150 40]);
inputY = uicontrol (f, "style", "edit", "position",[300 470 150 40]);
inputDecimales = uicontrol (f, "style", "edit", "position",[700 470 50 40]);
t2 = uicontrol (f, "style", "text", "string", "Y", "position",[270 470 20 40]);
t1 = uicontrol (f, "style", "text", "string", "X", "position",[10 470 20 40]);
t3 = uicontrol (f, "style", "text", "string", "Cantidad de decimales", "position",[500 470 150 40]);

global tLineal = uicontrol (f, "style", "text", "position",[420 320 200 40]);
global tParabola= uicontrol (f, "style", "text", "position",[420 280 200 40]);
global tExponencial= uicontrol (f, "style", "text", "position",[420 240 200 40]);
global tHiperbola= uicontrol (f, "style", "text", "position",[420 200 200 40]);
global tPotencial= uicontrol (f, "style", "text", "position",[420 160 200 40]);


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
  graficarLineal(listaX(1), listaX(length(listaX)), coeficientesLineal(1), coeficientesLineal(2));
  end
  
function mostrarFuncionLineal()
  global listaX;
  global listaY;
  global linealX;
  global linealY;
  global decimal;
  global tLineal;
  coeficientesLineal = lineal(sumaVector(listaX), sumaVector(listaY), sumaCuadradosVector(listaX), sumaVectorProductoXY(listaX, listaY), length(listaX),decimal);
  linealX = coeficientesLineal(1);
  linealY = coeficientesLineal(2);
  set(tLineal, "string", sprintf("Y = %dX + %d\n", coeficientesLineal(1),coeficientesLineal(2)));
end

function calcularParabola()
  global listaX;
  global listaY;
  global decimal;
  coeficientesParabola = parabola(length(listaX),sumaVector(listaX),sumaVector(listaY),sumaCuadradosVector(listaX),sumaCuboVector(listaX),sumaCuartaVector(listaX),sumaVectorProductoXY(listaX,listaY),sumaVectorProductoX2Y(listaX,listaY),decimal);
  graficarParabola(0, listaX(length(listaX)), coeficientesParabola(1),coeficientesParabola(2),coeficientesParabola(3));
  end

function mostrarFuncionParabola()
  global listaX;
  global listaY;
  global linealX;
  global linealY;
  global decimal;
  global tParabola;
  coeficientesParabola = parabola(length(listaX),sumaVector(listaX),sumaVector(listaY),sumaCuadradosVector(listaX),sumaCuboVector(listaX),sumaCuartaVector(listaX),sumaVectorProductoXY(listaX,listaY),sumaVectorProductoX2Y(listaX,listaY),decimal);
  linealX = coeficientesParabola(1);
  linealY = coeficientesParabola(2);
  set(tParabola, "string", sprintf("Y = %dX^2+ %dX + %d\n", coeficientesParabola(1),coeficientesParabola(2), coeficientesParabola(3)));
end

 function calcularExponencial()
  global listaX;
  global listaY;
  global decimal;
  coeficientesExponencial = exponencial(length(listaX),sumaVector(listaX),sumaVector(listaY),sumaVector(listaX),sumaLogaritmo(listaY),sumaCuadradosVector(listaX),sumaVectorProductoXLnY(listaX,listaY),decimal);
  graficarExponencial(0, listaX(length(listaX)), coeficientesExponencial(1),coeficientesExponencial(2));  
 end

function mostrarFuncionExponencial()
  global listaX;
  global listaY;
  global linealX;
  global linealY;
  global decimal;
  global tExponencial;
  coeficientesExponencial = exponencial(length(listaX),sumaVector(listaX),sumaVector(listaY),sumaVector(listaX),sumaLogaritmo(listaY),sumaCuadradosVector(listaX),sumaVectorProductoXLnY(listaX,listaY),decimal);
  linealX = coeficientesExponencial(1);
  linealY = coeficientesExponencial(2);
  set(tExponencial, "string", sprintf("Y = %d * e^(%dx)\n", coeficientesExponencial(2),coeficientesExponencial(1)));
end
 

 function calcularHiperbola()
  global listaX;
  global listaY;
  global decimal;
  coeficientesHiperbola = hiperbolica(length(listaX),sumaVector(listaX),sumaVector(listaY),sumaVector1X(listaX),sumaVector1X(listaY),sumaCuadrados1XVector(listaX),sumaVectorProducto1X1Y(listaX,listaY),decimal);
  graficarHiperbolica(0, listaX(length(listaX)), coeficientesHiperbola(1),coeficientesHiperbola(2));  
 end
 
function mostrarFuncionHiperbola()
  global listaX;
  global listaY;
  global decimal;
  global tHiperbola;
  coeficientesHiperbola = hiperbolica(length(listaX),sumaVector(listaX),sumaVector(listaY),sumaVector1X(listaX),sumaVector1X(listaY),sumaCuadrados1XVector(listaX),sumaVectorProducto1X1Y(listaX,listaY),decimal);
  set(tHiperbola, "string", sprintf("Y = %d  / (%d+X)\n", coeficientesHiperbola(1),coeficientesHiperbola(2)));
 end
 
 function calcularPotencial()
  global listaX;
  global listaY;
  global decimal;
  coeficientesPotencial = potencial(sumaLogaritmo(listaX),sumaLogaritmo(listaY),sumaLogaritmoCuadrado(listaX),sumaVectorProductoLnXLnY(listaX,listaY),length(listaX),decimal);
  graficarExponencial(0, listaX(length(listaX)), coeficientesPotencial(1),coeficientesPotencial(2));
 end

function mostrarFuncionPotencial()
  global listaX;
  global listaY;
  global decimal;
  global tPotencial;
  coeficientesPotencial = potencial(sumaLogaritmo(listaX),sumaLogaritmo(listaY),sumaLogaritmoCuadrado(listaX),sumaVectorProductoLnXLnY(listaX,listaY),length(listaX),decimal);
  set(tPotencial, "string", sprintf("Y = %dx^(%dX)\n", coeficientesPotencial(2),coeficientesPotencial(1)));
 end
 
 function mostrarTablaComparativa(checkLineal, checkParabola, checkExponencial, checkHiperbolica, checkPotencial)
   global listaX;
   global listaY;
   global decimal;
   mostrarTabla(get(checkLineal, "value"), get(checkParabola, "value"), get(checkExponencial, "value"), get(checkHiperbolica, "value"), get(checkPotencial, "value"), listaX, listaY, decimal);
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
