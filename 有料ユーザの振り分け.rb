# コントローラファイル

task_params = if user.premium?
  params.require(:task).permit(:name, :description, :special)
else
  params.require(:task).permit(:name, :description)
end

TAskにspecialというフラグを用意。
Strong Parametersを利用し、premumユーザのみspecialフラグを許可する（属性の選択的許可）。
