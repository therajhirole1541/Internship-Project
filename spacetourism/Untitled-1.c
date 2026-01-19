#include <stdio.h>

struct BankAccount {
    int accNo;
    char name[50];
    float balance;
};

int main() {
    struct BankAccount acc;
    int choice;
    float amount;
    int created = 0;

    do {
        printf("\n--- Banking Management System ---\n");
        printf("1. Create Account\n");
        printf("2. Deposit Money\n");
        printf("3. Withdraw Money\n");
        printf("4. Check Balance\n");
        printf("5. Display Account Details\n");
        printf("6. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter Account Number: ");
                scanf("%d", &acc.accNo);
                printf("Enter Account Holder Name: ");
                scanf("%s", acc.name);
                printf("Enter Initial Balance: ");
                scanf("%f", &acc.balance);
                created = 1;
                printf("Account Created Successfully!\n");
                break;

            case 2:
                if (created) {
                    printf("Enter Deposit Amount: ");
                    scanf("%f", &amount);
                    acc.balance += amount;
                    printf("Amount Deposited Successfully!\n");
                } else {
                    printf("Please create an account first!\n");
                }
                break;

            case 3:
                if (created) {
                    printf("Enter Withdrawal Amount: ");
                    scanf("%f", &amount);
                    if (amount <= acc.balance) {
                        acc.balance -= amount;
                        printf("Withdrawal Successful!\n");
                    } else {
                        printf("Insufficient Balance!\n");
                    }
                } else {
                    printf("Please create an account first!\n");
                }
                break;

            case 4:
                if (created)
                    printf("Current Balance: %.2f\n", acc.balance);
                else
                    printf("Please create an account first!\n");
                break;

            case 5:
                if (created) {
                    printf("\nAccount Number: %d\n", acc.accNo);
                    printf("Account Holder Name: %s\n", acc.name);
                    printf("Balance: %.2f\n", acc.balance);
                } else {
                    printf("Please create an account first!\n");
                }
                break;

            case 6:
                printf("Thank you for using Banking Management System!\n");
                break;

            default:
                printf("Invalid Choice!\n");
        }
    } while (choice != 6);

    return 0;
}
