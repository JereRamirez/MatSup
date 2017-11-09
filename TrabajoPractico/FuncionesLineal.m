addpath(pwd)
function  resultado = lineal(sumaX,sumaY, sumaXCuadrados, productoXY, N,R) %Calcula a y b para la aproximacion lineal    
    a = det([productoXY, sumaX; sumaY, N]) / det([sumaXCuadrados, sumaX; sumaX, N]);
    b = det([sumaXCuadrados, productoXY; sumaX, sumaY]) / det([sumaXCuadrados, sumaX; sumaX, N]);
    resultado = [funcionRedondeo(a,R),funcionRedondeo(b,R)];
endfunction


function graficarLineal(x1, x2, a, b)
  x = x1:0.1:x2;
  y = a * x + b;
  l = figure(5);
  plot(x,y);  
endfunction


function mostrarLineal(x1,x2)
  l = figure(6);
printf("Y = %dX + %d\n", x1, x2);
end

function redondeo = funcionRedondeo(x,n)
  a = x*(10^n);
  redondeo = (round (a)) / (10^n);
 end