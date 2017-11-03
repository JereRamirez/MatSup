addpath(pwd)
function resultado = exponencial(suman,sumax,sumay,sumaX, sumaY, sumaX2,sumaXY)
    matrizCoef=[sumaX2 sumax ; sumaX suman];
    matrizInv= inv(matrizCoef);
    terminosInd = [sumaXY;sumaY];
    AB = matrizInv*(terminosInd);
    a = AB(1);
    b = e^AB(2);
   resultado = [a,b];

endfunction 

  
  function graficarExponencial(x1, x2, a, b)
  x = x1:0.1:x2;
  y = b*exp(a*x);
  plot(x,y);  
endfunction

%Ejemplo de clase
res = exponencial(5, 7.50, 33.33, 7.50, 9.404,11.875,14.422);
printf("Y = %d * e^(%d*X)\n", res(2), res(1));
graficarExponencial(1, 2.9, res(1), res(2));