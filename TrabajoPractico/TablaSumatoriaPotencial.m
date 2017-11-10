FuncionesPotencial
 addpath(pwd);

function mostrarTablaPotencial(x, y, decimal)
  margen = 220;
  altura = 930;
  res =  potencial(sumaLogaritmo(x),sumaLogaritmo(y),sumaLogaritmoCuadrado(x),sumaVectorProductoLnXLnY(x,y),length(x),decimal);
  f = figure("position", [1, 1, 5000 1000], "name", "Tabla de funcion potencial", "numbertitle", "off");
  uicontrol (f, "style", "text", "string", "i", "position",[10 altura 20 30]);
  uicontrol (f ,"style", "text", "string", "X", "position",[80 altura 20 30]);
  uicontrol (f, "style", "text", "string", "Y", "position",[150 altura 20 30]);
  uicontrol (f, "style", "text", "string", "ln(X)", "position",[220 altura 20 30]);
  uicontrol (f, "style", "text", "string", "(ln(X))^2", "position",[290 altura 20 30]);
  uicontrol (f, "style", "text", "string", "ln(Y)", "position",[360 altura 20 30]);
  uicontrol (f, "style", "text", "string", "ln(X)*ln(Y)", "position",[430 altura 20 30]);
  uicontrol (f, "style", "text", "string", "Y'=f(x)", "position",[500 altura 20 30]);
  uicontrol (f, "style", "text", "string", "(Y-Y')^2", "position",[570 altura 20 30]);
  for i = 1:length(x)
    uicontrol (f, "style", "text", "string", num2str(i), "position",[10 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(x(i)), "position",[80 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(y(i)), "position",[150 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(log(x(i))), "position",[220 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str((log(x(i)))^2), "position",[290 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(log(y(i))), "position",[360 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(log(x(i))*log(y(i))), "position",[430 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo(res(2)*x(i) ^(x(i)*res(1)), decimal)), "position",[500 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(abs(y(i) - funcionRedondeo(res(2)*x(i) ^(x(i)*res(1)), decimal))), "position",[570 (altura-i*50) 20 30]);
  endfor
 end