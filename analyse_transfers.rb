require "csv"

transfers = {}

CSV.foreach("transfers.csv") do |row|
  name = "#{row[0]} to #{row[1]}"
  amount, currency = row[2].split(" ")
  amount_in_euro = if currency == "EUR"
    amount.to_f * 1.0
  elsif currency == "GBP"
    amount.to_f * 1.16
  elsif currency == "USD"
    amount.to_f * 0.98
  elsif currency == "CHF"
    amount.to_f * 0.92
  end

  if existing = transfers[name]
    existing[:sum] += amount_in_euro
    existing[:count] += 1

    if existing[:min] > amount_in_euro
      existing[:min] = amount_in_euro
    end

    if existing[:max] < amount_in_euro
      existing[:max] = amount_in_euro
    end
  else
    transfers[name] = {
      sum: amount_in_euro,
      count: 1,
      min: amount_in_euro,
      max: amount_in_euro
    }
  end
end

puts <<-HTML
<html>
  <head>
    <meta charset='utf-8'>
  </head>
  <body>
    <table>
      <tr>
        <th>Transfer</th>
        <th>Count</th>
        <th>Mean amount</th>
        <th>Min amount</th>
        <th>Max amount</th>
      </tr>
HTML

transfers.sort_by { |name, data| data[:count] }.reverse.each do |name, data|
  puts "<tr>"
  puts "<td>#{name}</td>"
  puts "<td>#{data[:count]}</td>"
  puts "<td>#{(data[:sum] / data[:count]).round(1)}€</td>"
  puts "<td>#{data[:min].round(1)}€</td>"
  puts "<td>#{data[:max].round(1)}€</td>"
  puts "</tr>"
end

puts "</table></body></html>"
