 FuncionesLineal
 Parabola
 FuncionesExponencial
 funcionesHiperbolica
 FuncionesPotencial
 TablaComparaciones
 TablaSumatoriaLineal
 TablaSumatoriaParabola
 TablaSumatoriaHiperbola
 TablaSumatoriaExponencial
 TablaSumatoriaPotencial
 
 addpath(pwd);
% f= figure(1,"deletefcn", "clear","name","TP Superior","position",get(0,"screensize")([3,4,3,4]).*[0.1 0.2 0.8 0.7]);                  
f = figure("deletefcn", "clear", "name", "TP Superior", "numbertitle", "off", "position", get(0,"screensize")([3,4,3,4]).*[0.1 0.2 0.8 0.7]);
global listaX = [];
global listaY = [];
global decimal = 2;

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
labelSumatoria = uicontrol (f, "style", "text", "string", "Sumatorias funcion:", "position",[20 30 180 40]);

botonSumatoriaLineal = uicontrol (f, "string", "Lineal", "position",[250 30 70 40], "callback", "sumatoriaLineal()");
botonSumatoriaParabola = uicontrol (f, "string", "Parabola", "position",[330 30 70 40], "callback", "sumatoriaParabola()");
botonSumatoriaExponencial = uicontrol (f, "string", "Exponencial", "position",[410 30 90 40], "callback", "sumatoriaExponencial()");
botonSumatoriaPotencial = uicontrol (f, "string", "Potencial", "position",[620 30 70 40], "callback", "sumatoriaPotencial()");
botonSumatoriaHiperbola = uicontrol (f, "string", "Hiperbola", "position",[520 30 90 40], "callback", "sumatoriaHiperbola()");

botonLimpiar = uicontrol(f, "string", "Limpiar",  "position", [720 10 70 40], "callback", "limpiar()");


checkLineal = uicontrol(f, "style", "checkbox", "string", "Lineal", "position", [250 80 70 40]);
checkParabola = uicontrol(f, "style", "checkbox", "string", "Parabola", "position", [330 80 70 40]);
checkExponencial = uicontrol(f, "style", "checkbox", "string", "Exponencial", "position", [410 80 90 40]);
checkHiperbolica = uicontrol(f, "style", "checkbox", "string", "Hiperbola", "position", [520 80 90 40]);
checkPotencial= uicontrol(f, "style", "checkbox", "string", "Potencial", "position", [620 80 70 40]);

global inputX = uicontrol (f, "style", "edit", "position",[40 470 150 40]);
global inputY = uicontrol (f, "style", "edit", "position",[300 470 150 40]);
inputDecimales = uicontrol (f, "style", "edit", "string", "2", "position",[700 470 50 40]);
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
  global inputX;
  global inputY;  
  listaX(length(listaX) + 1) = str2double(get(eX, "string"));
  listaY(length(listaY) + 1) = str2double(get(eY, "string"));  
  set(inputX, "string", "");
  set(inputY, "string", "");
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
  if(length(listaX) <2)
   cartelError();
   else
  coeficientesLineal = lineal(sumaVector(listaX), sumaVector(listaY), sumaCuadradosVector(listaX), sumaVectorProductoXY(listaX, listaY), length(listaX),decimal);
  linealX = coeficientesLineal(1);
  linealY = coeficientesLineal(2);
  graficarLineal(listaX(1), listaX(length(listaX)), coeficientesLineal(1), coeficientesLineal(2), listaX, listaY);
  plot(1:5, 5);
  endif
  end
  
function mostrarFuncionLineal()
  global listaX;
  global listaY;
  global linealX;
  global linealY;
  global decimal;
  global tLineal;
  if(length(listaX) <2)
   cartelError();
   else
  coeficientesLineal = lineal(sumaVector(listaX), sumaVector(listaY), sumaCuadradosVector(listaX), sumaVectorProductoXY(listaX, listaY), length(listaX),decimal);
  linealX = coeficientesLineal(1);
  linealY = coeficientesLineal(2);
  set(tLineal, "string", sprintf("Y = %dX + %d\n", coeficientesLineal(1),coeficientesLineal(2)));
endif
end

function sumatoriaLineal()
  global listaX;
  global listaY;
  global decimal;
  if(length(listaX) <2)
   cartelError();
   else
  mostrarTablaLineal(listaX,listaY,decimal);
  endif
  end
function sumatoriaParabola()
  global listaX;
  global listaY;
  global decimal;
  if(length(listaX) <2)
   cartelError();
   else
  mostrarTablaParabola(listaX,listaY,decimal);
  endif
  end
function sumatoriaPotencial()
  global listaX;
  global listaY;
  global decimal;
  if(length(listaX) <2)
   cartelError();
   else
  mostrarTablaPotencial(listaX,listaY,decimal);
  endif
  end
 function sumatoriaHiperbola()
  global listaX;
  global listaY;
  global decimal;
  if(length(listaX) <2)
   cartelError();
   else
  mostrarTablaHiperbola(listaX,listaY,decimal);
  endif
  end
 function sumatoriaExponencial()
  global listaX;
  global listaY;
  global decimal;
  if(length(listaX) <2)
   cartelError();
   else
  mostrarTablaExponencial(listaX,listaY,decimal);
  endif
  end

function calcularParabola()
  global listaX;
  global listaY;
  global decimal;
  if(length(listaX) <2)
   cartelError();
   else
  coeficientesParabola = parabola(length(listaX),sumaVector(listaX),sumaVector(listaY),sumaCuadradosVector(listaX),sumaCuboVector(listaX),sumaCuartaVector(listaX),sumaVectorProductoXY(listaX,listaY),sumaVectorProductoX2Y(listaX,listaY),decimal);
  graficarParabola(listaX(1), listaX(length(listaX)), coeficientesParabola(1),coeficientesParabola(2),coeficientesParabola(3),listaX, listaY);
  endif
  end

function mostrarFuncionParabola()
  global listaX;
  global listaY;
  global linealX;
  global linealY;
  global decimal;
  global tParabola;
  if(length(listaX) <2)
   cartelError();
   else
  coeficientesParabola = parabola(length(listaX),sumaVector(listaX),sumaVector(listaY),sumaCuadradosVector(listaX),sumaCuboVector(listaX),sumaCuartaVector(listaX),sumaVectorProductoXY(listaX,listaY),sumaVectorProductoX2Y(listaX,listaY),decimal);
  linealX = coeficientesParabola(1);
  linealY = coeficientesParabola(2);
  set(tParabola, "string", sprintf("Y = %dX^2+ %dX + %d\n", coeficientesParabola(1),coeficientesParabola(2), coeficientesParabola(3)));
endif
end

 function calcularExponencial()
  global listaX;
  global listaY;
  global decimal;
  if(length(listaX) <2)
   cartelError();
   else
  coeficientesExponencial = exponencial(length(listaX),sumaVector(listaX),sumaVector(listaY),sumaVector(listaX),sumaLogaritmo(listaY),sumaCuadradosVector(listaX),sumaVectorProductoXLnY(listaX,listaY),decimal);
  graficarExponencial(listaX(1), listaX(length(listaX)), coeficientesExponencial(1),coeficientesExponencial(2), listaX, listaY);  
 endif
 end

function mostrarFuncionExponencial()
  global listaX;
  global listaY;
  global linealX;
  global linealY;
  global decimal;
  global tExponencial;
  if(length(listaX) <2)
   cartelError();
   else
  coeficientesExponencial = exponencial(length(listaX),sumaVector(listaX),sumaVector(listaY),sumaVector(listaX),sumaLogaritmo(listaY),sumaCuadradosVector(listaX),sumaVectorProductoXLnY(listaX,listaY),decimal);
  linealX = coeficientesExponencial(1);
  linealY = coeficientesExponencial(2);
  set(tExponencial, "string", sprintf("Y = %d * e^(%dx)\n", coeficientesExponencial(2),coeficientesExponencial(1)));
endif
end
 

 function calcularHiperbola()
  global listaX;
  global listaY;
  global decimal;
  if(length(listaX) <2)
   cartelError();
   else
  coeficientesHiperbola = hiperbolica(length(listaX),sumaVector(listaX),sumaVector(listaY),sumaVector1X(listaX),sumaVector1X(listaY),sumaCuadrados1XVector(listaX),sumaVectorProducto1X1Y(listaX,listaY),decimal);
  graficarHiperbolica(listaX(1), listaX(length(listaX)), coeficientesHiperbola(1),coeficientesHiperbola(2), listaX, listaY);  
 endif
 end
 
function mostrarFuncionHiperbola()
  global listaX;
  global listaY;
  global decimal;
  global tHiperbola;
  if(length(listaX) <2)
   cartelError();
   else
  coeficientesHiperbola = hiperbolica(length(listaX),sumaVector(listaX),sumaVector(listaY),sumaVector1X(listaX),sumaVector1X(listaY),sumaCuadrados1XVector(listaX),sumaVectorProducto1X1Y(listaX,listaY),decimal);
  set(tHiperbola, "string", sprintf("Y = %d  / (%d+X)\n", coeficientesHiperbola(1),coeficientesHiperbola(2)));
 endif
 end
 
 function calcularPotencial()
  global listaX;
  global listaY;
  global decimal;
  if(length(listaX) <2)
   cartelError();
   else
  coeficientesPotencial = potencial(sumaLogaritmo(listaX),sumaLogaritmo(listaY),sumaLogaritmoCuadrado(listaX),sumaVectorProductoLnXLnY(listaX,listaY),length(listaX),decimal);
  graficarPotencial(listaX(1), listaX(length(listaX)), coeficientesPotencial(1),coeficientesPotencial(2), listaX, listaY);
 endif
 end

function mostrarFuncionPotencial()
  global listaX;
  global listaY;
  global decimal;
  global tPotencial;
  if(length(listaX) <2)
   cartelError();
   else
  coeficientesPotencial = potencial(sumaLogaritmo(listaX),sumaLogaritmo(listaY),sumaLogaritmoCuadrado(listaX),sumaVectorProductoLnXLnY(listaX,listaY),length(listaX),decimal);
  set(tPotencial, "string", sprintf("Y = %dx^(%dX)\n", coeficientesPotencial(2),coeficientesPotencial(1)));
 endif
 end
 
 function mostrarTablaComparativa(checkLineal, checkParabola, checkExponencial, checkHiperbolica, checkPotencial)
   global listaX;
   global listaY;
   global decimal;
   if(length(listaX) <2)
   cartelError();
   else
   mostrarTabla(get(checkLineal, "value"), get(checkParabola, "value"), get(checkExponencial, "value"), get(checkHiperbolica, "value"), get(checkPotencial, "value"), listaX, listaY, decimal);
 endif
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


function limpiar()
  global listaX;
  listaX = [];
  global listaY;
  listaY = [];
  global decimal;
  decimal = 2;
  global inputX;
  global inputY;
  set(inputX, "string", "");
  set(inputY, "string", "");
  global tLineal;
  global tParabola;
  global tExponencial;
  global tHiperbola;
  global tPotencial;
  set(tLineal, "string", "");
  set(tParabola, "string", "");
  set(tExponencial, "string", "");
  set(tHiperbola, "string", "");
  set(tPotencial, "string", "");
end

function cartelError()
  msgbox("Inrese por lo menos dos pares de numeros", "Error");
end  