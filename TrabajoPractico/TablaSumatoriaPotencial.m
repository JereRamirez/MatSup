FuncionesPotencial
 addpath(pwd);

function mostrarTablaPotencial(x, y, decimal)
  margen = 220;
  altura = 930;
  totalX = 0;
  totalY = 0;
  totalXcuadrado = 0;
  totalXY = 0;
  res =  potencial(sumaLogaritmo(x),sumaLogaritmo(y),sumaLogaritmoCuadrado(x),sumaVectorProductoLnXLnY(x,y),length(x),decimal);
  f = figure("position", [1, 1, 5000 1000], "name", "Tabla de funcion potencial", "numbertitle", "off");
  uicontrol (f, "style", "text", "string", "i", "position",[10 altura 90 30]);
  uicontrol (f ,"style", "text", "string", "x", "position",[80 altura 90 30]);
  uicontrol (f, "style", "text", "string", "y", "position",[150 altura 90 30]);
  uicontrol (f, "style", "text", "string", "X=ln(x)", "position",[220 altura 90 30]);
  uicontrol (f, "style", "text", "string", "X^2", "position",[290 altura 90 30]);
  uicontrol (f, "style", "text", "string", "Y=ln(y)", "position",[360 altura 90 30]);
  uicontrol (f, "style", "text", "string", "X*Y", "position",[430 altura 90 30]);
  for i = 1:length(x)
    totalX += (funcionRedondeo(log(x(i)), decimal));
    totalY += (funcionRedondeo(log(y(i)), decimal));
    totalXY += (funcionRedondeo(log(x(i))*log(y(i)), decimal));
    totalXcuadrado += (funcionRedondeo((log(x(i)))^2, decimal));
   endfor
  for i = 1:(length(x))
    uicontrol (f, "style", "text", "string", num2str(i), "position",[10 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(x(i)), "position",[80 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(y(i)), "position",[150 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo(log(x(i)), decimal)), "position",[220 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo((log(x(i)))^2, decimal)), "position",[290 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo(log(y(i)), decimal)), "position",[360 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo(log(x(i))*log(y(i)), decimal)), "position",[430 (altura-i*50) 90 30]);
  endfor
  uicontrol (f, "style", "text", "string", "Total", "position",[10 (altura-(length(x)+1)*50) 90 30]);
  uicontrol (f, "style", "text", "string", num2str(sum(x)), "position",[80 (altura-(length(x)+1)*50) 90 30]);
  uicontrol (f, "style", "text", "string", num2str(sum(y)), "position",[150 (altura-(length(x)+1)*50) 90 30]);
  uicontrol (f, "style", "text", "string", num2str(totalX), "position",[220 (altura-(length(x)+1)*50) 90 30]);
  uicontrol (f, "style", "text", "string", num2str(totalXcuadrado), "position",[290 (altura-(length(x)+1)*50) 90 30]);
  uicontrol (f, "style", "text", "string", num2str(totalY), "position",[360 (altura-(length(x)+1)*50) 90 30]);
  uicontrol (f, "style", "text", "string", num2str(totalXY), "position",[430 (altura-(length(x)+1)*50) 90 30]);
end