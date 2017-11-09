 addpath(pwd);

f = figure("deletefcn", "clear", "name", "TP Superior", "numbertitle", "off");
global listaX = [];
global listaY = [];


botonAgregar = uicontrol (f, "string", "Agregar par de puntos", "position",[20 290 150 40], "callback", "agregar(inputX, inputY)");
botonLineal = uicontrol (f, "string", "Calcular lineal", "position",[20 190 150 40], "callback", "calcularLineal(inputX, inputY)");
inputX = uicontrol (f, "style", "edit", "position",[40 350 150 40]);
inputY = uicontrol (f, "style", "edit", "position",[300 350 150 40]);
t2 = uicontrol (f, "style", "text", "string", "Y", "position",[270 350 20 40]);
t1 = uicontrol (f, "style", "text", "string", "X", "position",[10 350 20 40]);

function agregar(eX, eY)
  global listaX;
  global listaY;
  listaX(length(listaX) + 1) = str2double(get(eX, "string"));
  listaY(length(listaY) + 1) = str2double(get(eY, "string"));  
end

function calcularLineal()
  global listaX;
  global listaY;
  coeficientesLineal = lineal(sumaVector(listaX), sumaVector(listaY), sumaCuadradosVector(listaX), sumaVectorProductoXY(listaX, listaY), length(listaX));
  graficarLineal(listaX(1), listaX(length(listaX)), coeficientesLineal(1), coeficientesLineal(2));
end

function suma = sumaVector(v)
  suma = 0;
  for i = 1:length(v)
     suma = suma + v(i);
  endfor  
end

function suma = sumaCuadradosVector(v)
  suma = 0;
  for i = 1:length(v)
     suma = suma + v(i) * v(i);
  endfor  
end

function suma = sumaVectorProductoXY(v1, v2)
  suma = 0;
  for i = 1:length(v1)
     suma = suma + v1(i) * v2(i);
  endfor  
end
