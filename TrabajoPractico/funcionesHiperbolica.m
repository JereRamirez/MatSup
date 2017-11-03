addpath(pwd)
function resultado = hiperbolica(suman,sumax,sumay,sumaX, sumaY, sumaX2,sumaXY)
    matrizCoef=[sumaX2 sumaX ; sumaX suman];
    matrizInv= inv(matrizCoef);
    terminosInd = [sumaXY;sumaY];
    AB = matrizInv*(terminosInd);
    a = 1/AB(2);
    b = AB(1)/a;
   resultado = [a,b];

endfunction 

  
  function graficarHiperbolica(x1, x2, a, b)
  x = x1:0.1:x2;
  y = a ./(b+x);
  plot(x,y);  
  grid

endfunction

%Ejemplo de clase
res = hiperbolica(4, 10, 32, 2.083, 0.642,1.424,0.409);
printf("Y = %d  / (%d+X)\n", res(1), res(2));
graficarHiperbolica(1, 2.9, res(1), res(2));