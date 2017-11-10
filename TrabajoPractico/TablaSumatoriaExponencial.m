FuncionesExponencial
 addpath(pwd);

function mostrarTablaExponencial(x, y, decimal)
  margen = 220;
  altura = 930;
  res = exponencial(length(x),sumaVector(x),sumaVector(y),sumaVector(x),sumaLogaritmo(y),sumaCuadradosVector(x),sumaVectorProductoXLnY(x,y),decimal);
  f = figure("position", [1, 1, 5000 1000], "name", "Tabla de funcion exponencial", "numbertitle", "off");
  uicontrol (f, "style", "text", "string", "i", "position",[10 altura 20 30]);
  uicontrol (f ,"style", "text", "string", "X", "position",[80 altura 20 30]);
  uicontrol (f, "style", "text", "string", "Y", "position",[150 altura 20 30]);
  uicontrol (f, "style", "text", "string", "X^2", "position",[220 altura 20 30]);
  uicontrol (f, "style", "text", "string", "X*Y", "position",[290 altura 20 30]);
  uicontrol (f, "style", "text", "string", "ln(Y)", "position",[360 altura 20 30]);
  uicontrol (f, "style", "text", "string", "X*ln(Y)", "position",[430 altura 20 30]);
  uicontrol (f, "style", "text", "string", "Y'=f(x)", "position",[500 altura 20 30]);
  uicontrol (f, "style", "text", "string", "(Y-Y')^2", "position",[570 altura 20 30]);
  for i = 1:length(x)
    uicontrol (f, "style", "text", "string", num2str(i), "position",[10 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(x(i)), "position",[80 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(y(i)), "position",[150 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(x(i)^2), "position",[220 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(y(i)*x(i)), "position",[290 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(log(y(i))), "position",[360 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(x(i)*log(y(i))), "position",[430 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo(res(2)*e ^(x(i)*res(1)), decimal)), "position",[500 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(abs(y(i) - (funcionRedondeo(res(2)*e ^(x(i)*res(1)), decimal)))), "position",[570 (altura-i*50) 20 30]);
  endfor
 end