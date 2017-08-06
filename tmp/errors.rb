def levantar_erro
  p ">>>>>>>>>> Antes do erro"
  raise
  p "Depois do erro"
  
end

levantar_erro