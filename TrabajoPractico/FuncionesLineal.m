addpath(pwd)
function  resultado = lineal(sumaX,sumaY, sumaXCuadrados, productoXY, N) %Calcula a y b para la aproximacion lineal    
    a = det([productoXY, sumaX; sumaY, N]) / det([sumaXCuadrados, sumaX; sumaX, N]);
    b = det([sumaXCuadrados, productoXY; sumaX, sumaY]) / det([sumaXCuadrados, sumaX; sumaX, N]);
    resultado = [a,b];
endfunction


function graficarLineal(x1, x2, a, b)
  x = x1:0.1:x2;
  y = a * x + b;
  plot(x,y);  
endfunction

%Ejemplo de clase
res = lineal(9.6, 26.7, 21.1, 58.51, 5);
printf("%dX + %d", res(1), res(2));
graficarLineal(1, 2.9, res(1), res(2));

