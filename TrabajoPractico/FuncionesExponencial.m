addpath(pwd);
function resultado = exponencial(n,sumax,sumay,sumaX, sumaY, sumaX2,sumaXY,R)
    matrizCoef=[sumaX2 sumax ; sumaX n];
    matrizInv= inv(matrizCoef);
    terminosInd = [sumaXY;sumaY];
    AB = matrizInv*(terminosInd);
    a = funcionRedondeo(AB(1),R);
    b = funcionRedondeo(e^AB(2),R);
   resultado = [a,b];

endfunction 

  
  function graficarExponencial(x1, x2, a, b)
  x = x1:0.1:x2;
  y = b*exp(a*x);
  l = figure(5);
  plot(x,y);  
endfunction


function redondeo = funcionRedondeo(x,n)
  a = x*(10^n);
  redondeo =(round (a)) / (10^n);;
 end
%Ejemplo de clase
%res = exponencial(4,10,18,10,4.6,30,7.59,2);
%printf("Y = %d * e^(%d*X)\n", res(2), res(1));
%graficarExponencial(0, 2.9, res(1), res(2));