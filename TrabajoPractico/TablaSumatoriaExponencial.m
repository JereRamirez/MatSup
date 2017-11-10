FuncionesExponencial
addpath(pwd);

function mostrarTablaExponencial(x, y, decimal)
  margen = 220;
  altura = 930;
  xCuadrado = 0;
  logaritmoY = 0;
  productoXlogY = 0;
  res = exponencial(length(x),sumaVector(x),sumaVector(y),sumaVector(x),sumaLogaritmo(y),sumaCuadradosVector(x),sumaVectorProductoXLnY(x,y),decimal);
  f = figure("position", [1, 1, 5000 1000], "name", "Tabla de funcion exponencial", "numbertitle", "off");
  uicontrol (f, "style", "text", "string", "i", "position",[10 altura 20 30]);
  uicontrol (f ,"style", "text", "string", "x", "position",[80 altura 20 30]);
  uicontrol (f, "style", "text", "string", "y", "position",[150 altura 20 30]);
  uicontrol (f, "style", "text", "string", "X=x", "position",[220 altura 20 30]);
  uicontrol (f, "style", "text", "string", "X^2", "position",[290 altura 20 30]);
  uicontrol (f, "style", "text", "string", "Y=ln(y)", "position",[360 altura 20 30]);
  uicontrol (f, "style", "text", "string", "X*Y", "position",[430 altura 20 30]);

  for i = 1:length(x)
    xCuadrado += (funcionRedondeo((x(i)^2), decimal));
    logaritmoY += (funcionRedondeo((log(y(i))), decimal));
    productoXlogY += (funcionRedondeo((x(i)*log(y(i))), decimal));
   endfor
  
  for i = 1:(length(x)+1)
    uicontrol (f, "style", "text", "string", num2str(i), "position",[10 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(x(i)), "position",[80 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(y(i)), "position",[150 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(x(i)), "position",[220 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo((x(i)^2), decimal)), "position",[290 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo((log(y(i))), decimal)), "position",[360 (altura-i*50) 20 30]);
    uicontrol (f, "style", "text", "string", num2str(funcionRedondeo((x(i)*log(y(i))), decimal)), "position",[430 (altura-i*50) 20 30]);
    if(i==(length(x)+1))
      uicontrol (f, "style", "text", "string", "Total", "position",[10 (altura-i*50) 20 30]);
      uicontrol (f, "style", "text", "string", num2str(sum(x)), "position",[80 (altura-i*50) 20 30]);
      uicontrol (f, "style", "text", "string", num2str(sum(y)), "position",[150 (altura-i*50) 20 30]);
      uicontrol (f, "style", "text", "string", num2str(sum(x)), "position",[220 (altura-i*50) 20 30]);
      uicontrol (f, "style", "text", "string", num2str(xCuadrado), "position",[290 (altura-i*50) 20 30]);
      uicontrol (f, "style", "text", "string", num2str(logaritmoY), "position",[360 (altura-i*50) 20 30]);
      uicontrol (f, "style", "text", "string", num2str(productoXlogY), "position",[430 (altura-i*50) 20 30]);
     endif
  endfor
 end