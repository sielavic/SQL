 SELECT c.*,

 COALESCE((select sum(width * height * length/10000)
       from boxes b
          where b.ID_CONTAINER = c.ID 
          and b.ID_CONTAINER_MOVE = 0
          and b.ID_STOCK = 1
          and b.STATUS = 0
          and b.NN_REZERV = 0
          ), 0)
          
          +
          
          COALESCE((select sum(width * height * length/10000)
       from boxes b
          where b.ID_CONTAINER_MOVE = c.ID 
          and b.ID_STOCK = 1
          and b.STATUS = 0
          and b.NN_REZERV = 0
          ), 0) SUMMA
 FROM containers c
 WHERE c.STATUS = 0
   AND COALESCE((select sum(width * height * length/10000)
       from boxes b
          where b.ID_CONTAINER = c.ID 
          and b.ID_CONTAINER_MOVE = 0
          and b.ID_STOCK = 1
          and b.STATUS = 0
          and b.NN_REZERV = 0
          ) , 0)
          +
          COALESCE((select sum(width * height * length/10000)
       from boxes b
          where b.ID_CONTAINER_MOVE = c.ID 
          and b.ID_STOCK = 1
          and b.STATUS = 0
          and b.NN_REZERV = 0
          ) , 0)
          
          > 50