
import SwiftUI

struct AddOnCheckboxView: View {
    let title: String
    @State var options: [(name: String, price: Double, isSelected: Bool)]
    let selectionType: SelectionType
    @Binding var selectedPrice: Double
    
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
                HStack(spacing: 16) {
                    Text(options[index].name)
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundStyle(.primaryText)
                    
                    Spacer()
                    
                    Text(String(format: "+$%.2f", options[index].price))
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundStyle(.primaryText)
                    
                    Image(systemName: selectionType == .single ?
                          (options[index].isSelected ? "largecircle.fill.circle" : "circle") :
                          (options[index].isSelected ? "checkmark.square.fill" : "square"))
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(options[index].isSelected ? .blue : .gray)
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
            // Bread logic: Deselect all others
            options.indices.forEach { i in
                options[i].isSelected = (i == index)
            }
        case .multiple:
            // Extras logic: Toggle current item
            options[index].isSelected.toggle()
        }
    }
    
    private func calculateTotal() {
        let selectedOption = options.filter { option in
            option.isSelected
        }
        
        var totalPrice = 0.0
        for option in selectedOption {
            totalPrice += option.price
        }
        selectedPrice = totalPrice
    }
}

#Preview {
    Group {
        // Preview for bread selection (single)
        AddOnCheckboxView(
            title: "Select Your Bread",
            options: [
                (name: "Roll", price: 0.0, isSelected: false),
                (name: "Hero", price: 1.99, isSelected: false),
                (name: "Wrap", price: 2.49, isSelected: false)
            ],
            selectionType: .single,
            selectedPrice: .constant(0.0)
        )
        
        // Preview for extras selection (multiple)
        AddOnCheckboxView(
            title: "Extras",
            options: [
                (name: "Lettuce", price: 0.5, isSelected: false),
                (name: "Tomato", price: 0.5, isSelected: false),
                (name: "Avocado", price: 1.0, isSelected: false)
            ],
            selectionType: .multiple,
            selectedPrice: .constant(0.0)
        )
    }
}
