abstract class Account {
  int accountNumber = 0;
  double balance = 0;

  deposit(double amount) {
    balance += amount;
    print("Deposited \$$amount! Current Balance \$$balance");
  }

  withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate) {
    super.accountNumber = accountNumber;
    super.balance = balance;
  }

  @override
  withdraw(double amount) {
    balance -= amount;
    balance += balance * interestRate;
    print("Withdrawn \$$amount! Current Balance with ${interestRate*100}% interest \$$balance");
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit) {
    super.balance = balance;
    super.accountNumber = accountNumber;
  }

  @override
  withdraw(double amount) {
    if (balance - amount >= 0 && amount <= overdraftLimit) {
      balance -= amount;
      print("Withdrawn \$$amount! Current Balance \$$balance");
    } else {
      print("Insufficient funds! Amount \$$amount is greater than overdraft limit.");
      print("Balance \$$balance");
    }
  }
}

void main() {
  SavingsAccount person = SavingsAccount(54654, 5000, .1);
  print("Initial Balance \$${person.balance}");
  person.deposit(2000);
  person.withdraw(5000);

  CurrentAccount ca = CurrentAccount(65465, 5000, 5000);
  print("Initial Balance \$${ca.balance}");
  ca.deposit(2000);
  ca.withdraw(5000);
  ca.withdraw(2300);
}