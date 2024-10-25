import Nat "mo:base/Nat";
import Array "mo:base/Array";
actor ExpensesTracker {

    // Define a record type to store individual expense
    type Expense = {
        description: Text;
        amount: Nat;
    };

    // Mutable array to store all expenses
    var expenses: [Expense] = [];

    // Function to add an expense
    public func addExpense(description: Text, amount: Nat): async () {
        let newExpense = { description = description; amount = amount };
        expenses := Array.append(expenses, [newExpense]);
    };

    // Function to get the list of all expenses
    public query func getExpenses(): async [Expense] {
        return expenses;
    };

    // Function to get the total amount of expenses
    public query func getTotalExpenses(): async Nat {
        var total: Nat = 0;
        for (expense in expenses.vals()) {
            total += expense.amount;
        };
        return total;
    };
}
