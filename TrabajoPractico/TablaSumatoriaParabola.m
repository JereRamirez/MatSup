Parabola
 addpath(pwd);

function mostrarTablaParabola(x, y, decimal)
  margen = 220;
  altura = 930;
  totalXcuadrado = 0;
  totalXY = 0;
  totalXcuadradoY = 0;
  totalXcubo = 0;
  totalXcuarta = 0;
  res = parabola(length(x),sumaVector(x),sumaVector(y),sumaCuadradosVector(x),sumaCuboVector(x),sumaCuartaVector(x),sumaVectorProductoXY(x,y),sumaVectorProductoX2Y(x,y),decimal);
  f = figure("position", [1, 1, 5000 1000], "name", "Tabla de funcion parabola", "numbertitle", "off");
  uicontrol (f, "style", "text", "string", "i", "position",[10 altura 90 30]);
  uicontrol (f ,"style", "text", "string", "x", "position",[80 altura 90 30]);
  uicontrol (f, "style", "text", "string", "y", "position",[150 altura 90 30]);
  uicontrol (f, "style", "text", "string", "x^2", "position",[220 altura 90 30]);
  uicontrol (f, "style", "text", "string", "x^3", "position",[290 altura 90 30]);
  uicontrol (f, "style", "text", "string", "x^4", "position",[360 altura 90 30]);
  uicontrol (f, "style", "text", "string", "x*y", "position",[430 altura 90 30]);
  uicontrol (f, "style", "text", "string", "(x^2)*y", "position",[500 altura 90 30]);
  for i = 1:length(x)
    totalXcuadrado += (funcionRedondeo((x(i)^2), decimal));
    totalXcubo += (funcionRedondeo((x(i)^3), decimal));
    totalXcuarta += (funcionRedondeo((x(i)^4), decimal));
    totalXY += (funcionRedondeo((y(i)*x(i)), decimal));
    totalXcuadradoY += (funcionRedondeo((x(i)^2)*y(i), decimal));
   endfor
  for i = 1:(length(x))
    uicontrol (f, "style", "text", "string", num2str(i), "position",[10 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(x(i)), "position",[80 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(y(i)), "position",[150 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo((x(i)^2), decimal)), "position",[220 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo((x(i)^3), decimal)), "position",[290 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo((x(i)^4), decimal)), "position",[360 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo((y(i)*x(i)), decimal)), "position",[430 (altura-i*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo((x(i)^2)*y(i), decimal)), "position",[500 (altura-i*50) 90 30]);
  endfor
    uicontrol (f, "style", "text", "string", "Total", "position",[10 (altura-(length(x)+1)*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(sum(x)), "position",[80 (altura-(length(x)+1)*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(sum(y)), "position",[150 (altura-(length(x)+1)*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(totalXcuadrado), "position",[220 (altura-(length(x)+1)*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(totalXcubo), "position",[290 (altura-(length(x)+1)*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(totalXcuarta), "position",[360 (altura-(length(x)+1)*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(totalXY), "position",[430 (altura-(length(x)+1)*50) 90 30]);
    uicontrol (f, "style", "text", "string", num2str(totalXcuadradoY), "position",[500 (altura-(length(x)+1)*50) 90 30]);   
  
 end