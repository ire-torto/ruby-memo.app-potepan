require "csv" 
require "fileutils"
puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i 

if memo_type == 1
    p "拡張子を除いたファイル名を入力してくだいさい"
    file_name = gets.chomp
    p "メモしたい内容を記入してくだいさい"
    p "完了したらCtrl + Dをおします"
    
    lines =  STDIN.readlines
    len = lines.length
    i = 0
    
    while i < len
        lines[i] = lines[i].chomp
        i += 1
    end
    
    CSV.open("#{file_name}.csv", "w") do |csv|
        csv<< lines
    end

elsif memo_type == 2
    # 作成されたcsvファイルを表示する
    p "編集したいファイルの「ファイル名」を指定してください"
    file_name_seach = gets.chomp
    # ファイル名のメモを表示
    f = File.open("#{file_name_seach}.csv", "r")
    message = f.read
    f.close
    puts message
    
    p "上書きする内容を入力"
    p "完了したらCtrl + Dをおします"
    
    update_memo = STDIN.readlines
    update_len = update_memo.length
    i = 0
    
    while i < update_len
        update_memo[i] = update_memo[i].chomp
        i += 1
    end
    
    CSV.open("#{file_name_seach}.csv", "w") do |csv|
        csv<< update_memo
    end
else
    p "1か2を入力してください"
end


__END__