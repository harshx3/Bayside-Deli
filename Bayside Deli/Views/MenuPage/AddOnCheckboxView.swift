import SwiftUI

struct AddOnCheckboxView: View {
    let title: String
    let options: [(name: String, price: Double)]
    let selectionType: SelectionType
    @Binding var selectedPrice: Double
    @Binding var selectedOption: String?
    @Binding var selectedOptions: [String]
    
    enum SelectionType {
        case single  // For bread (only one selection)
        case multiple  // For extras (multiple selections)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .foregroundStyle(.secondaryText)
            
            ForEach(options.indices, id: \.self) { index in
                let isSelected = (selectionType == .single) ?
                    (selectedOption == options[index].name) :
                    (selectedOptions.contains(options[index].name))
                
                HStack(spacing: 16) {
                    Text(options[index].name)
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundStyle(.primaryText)
                    
                    Spacer()
                    
                    Text(String(format: "+$%.2f", options[index].price))
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundStyle(.primaryText)
                    
                    Image(systemName: selectionType == .single ?
                          (isSelected ? "largecircle.fill.circle" : "circle") :
                          (isSelected ? "checkmark.square.fill" : "square"))
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(isSelected ? .blue : .gray)
                        .onTapGesture {
                            updateSelection(at: index)
                            calculateTotal()
                        }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
        }
        .background(.secondary.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 16)
    }
    
    private func updateSelection(at index: Int) {
        switch selectionType {
        case .single:
            selectedOption = options[index].name
            selectedOptions.removeAll()
        case .multiple:
            let optionName = options[index].name
            if selectedOptions.contains(optionName) {
                selectedOptions.removeAll(where: { $0 == optionName })
            } else {
                selectedOptions.append(optionName)
            }
            selectedOption = nil
        }
    }
    
    private func calculateTotal() {
        var totalPrice = 0.0
        switch selectionType {
        case .single:
            if let selected = selectedOption,
               let option = options.first(where: { $0.name == selected }) {
                totalPrice = option.price
            }
        case .multiple:
            for selected in selectedOptions {
                if let option = options.first(where: { $0.name == selected }) {
                    totalPrice += option.price
                }
            }
        }
        selectedPrice = totalPrice
    }
}

struct BreadPreviewWrapper: View {
    @State private var selectedPrice: Double = 0.0
    @State private var selectedOption: String? = nil
    @State private var selectedOptions: [String] = []
    
    var body: some View {
        AddOnCheckboxView(
            title: "Select Your Bread",
            options: [
                (name: "Roll", price: 0.0),
                (name: "Hero", price: 1.99),
                (name: "Wrap", price: 2.49)
            ],
            selectionType: .single,
            selectedPrice: $selectedPrice,
            selectedOption: $selectedOption,
            selectedOptions: $selectedOptions
        )
    }
}

struct ExtrasPreviewWrapper: View {
    @State private var selectedPrice: Double = 0.0
    @State private var selectedOption: String? = nil
    @State private var selectedOptions: [String] = []
    
    var body: some View {
        AddOnCheckboxView(
            title: "Extras",
            options: [
                (name: "Lettuce", price: 0.5),
                (name: "Tomato", price: 0.5),
                (name: "Avocado", price: 1.0)
            ],
            selectionType: .multiple,
            selectedPrice: $selectedPrice,
            selectedOption: $selectedOption,
            selectedOptions: $selectedOptions
        )
    }
}

#Preview {
    Group {
        BreadPreviewWrapper()
        ExtrasPreviewWrapper()
    }
}
