%==AHP
function [Max_PT_Score] = ahp()
disp('MPB - Kriteria');
               % Qly, FP, PP, W
MBP_Kriteria = [ 1/1 3/1 2/1 2/1; % Qly
                 1/3 1/1 1/3 1/2; % FP 
                 1/2 3/1 1/1 1/1; % PP
                 1/2 2/1 1/1 1/1] % W

    %-Weigth/Bobot Kriteria
    w_MPB = calc_norm(MBP_Kriteria)
    [m n] = size(w_MPB)
    for i=1 : m,
        sumRow = 0;
        for j=1 : n,
            sumRow = sumRow + w_MPB(i, j);
        end;
        V(i) = (sumRow);
    end;
    disp('Eigenvector')
    w_MBP = transpose(V)/m;
   
  %%==Membandingkan Kualitas
  disp('Perbandingan Kualitas: Alternatif Kualitatif Berpasangan');
   pt_a = 85;
   pt_b = 80;
   pt_c = 90;
   pt_d = 95;
   
   AKB_K = [ pt_a;
             pt_b;
             pt_c;
             pt_d]
   %-Weigth/Bobot Kualitas
   w_K = calc_norm(AKB_K)
   
   %%==Membandingkan Fleksibilitas Pembayaran
   disp('Perbandingan Fleksibilitas Pembayaran: Alternatif Kualitatif Berpasangan');
                % A1, A2, A3, A4
   AKB_FP =    [ 1/1 2/1 3/1 4/1; % A1
                 1/2 1/1 2/1 3/1; % A2
                 1/3 1/2 1/1 2/1; % A3
                 1/4 1/3 1/2 1/1] % A4
   % Weigth/Bobot Fleksibilitas Pembayaran
   w_FP = calc_norm(AKB_FP);
   [m n] = size(w_FP)
   for i=1 : m,
       sumRow = 0;
       for j=1 : n,
           sumRow = sumRow + w_FP(i,j);
       end;
       V(i) = (sumRow)
   end;
    disp('Eigenvector')
    w_FP = transpose(V)/m;
    
  %%==Membandingkan Pemenuhan Pesanan
  disp('Perbandingan Pemenuhan Pesanan: Alternatif Kualitatif Berpasangan');
               % A1, A2, A3, A4
   AKB_FP =    [ 1/1 2/1 1/2 1/3; % A1
                 1/2 1/1 1/3 1/4; % A2
                 2/1 3/1 1/1 1/2; % A3
                 3/1 4/1 2/1 1/1] % A4
   %-Weight/Bobot PP
   w_PP = calc_norm(AKB_FP);
   [m n] = size(w_PP);
   for i=1 : m,
       sumRow = 0
       for j=1 : n,
           sumRow = sumRow + w_PP(i,j);
       end;
       V(i) = (sumRow);
   end;
   disp('EigenVector');
   w_PP = transpose(V)/m
   
  %%==Membandingkan Waktu
  disp('Perbandingan Waktu: Alternatif Kualitatif Berpasangan');
               % A1, A2, A3, A4
   AKB_W =     [ 1/1 2/1 3/1 1/2; % A1
                 1/2 1/1 2/1 1/3; % A2
                 1/3 2/1 1/1 1/4; % A3
                 2/1 3/1 4/1 1/1] % A4
   %-Weight/Bobot Waktu
   w_W = calc_norm(AKB_W);
   [m n] = size(w_W);
   for i=1 : m,
       sumRow = 0;
       for j=1 : n,
           sumRow = sumRow + w_W(i,j);
       end;
       V(i) = (sumRow);
   end;
   disp('EigenVector');
   w_W = transpose(V)/m;
   
 %%== Menghitung Jawaban Terakhir
 wM = [w_K w_FP w_PP w_W]
 disp('Nilai Akhir untuk: PT_A, PT_B, PT_C, PT_D');
 MC_Scores = wM * w_MPB
 
 %%== PT Terbaik
 disp('Nilai PT Terbaik terpilih berdasarkan manfaat (kriteria)');
 Max_MC_Benefits = max(MC_Scores)
 
    %% == Helper Function Kalkulasi Normalisasi MBP Kriteria dan Alternatif
    function [normvect] = calc_norm(M)
        sM = sum(M);
        normvect = M./sM;
        disp('Normalisasi Matriks');
    end
end
