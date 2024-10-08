import { Routes } from '@angular/router';
import { OverviewPageComponent } from './views/overview-page/overview-page.component';
import { SigninPageComponent } from './views/signin-page/signin-page.component';
import { UsersPageComponent } from './views/users-page/users-page.component';
import { ExpensesPageComponent } from './views/expenses-page/expenses-page.component';
import { authGuardGuard } from './guards/auth/auth-guard.guard';
import { PageNotFoundComponent } from './views/page-not-found/page-not-found.component';
import { AddUserPageComponent } from './views/add-user-page/add-user-page.component';
import { EditUserPageComponent } from './views/edit-user-page/edit-user-page.component';
import { ExpenseDetaliPageComponent } from './views/expense-detali-page/expense-detali-page.component';


const protectedRoutes: Routes = [

    {
        path: "",
        component: OverviewPageComponent,
        title: "Overview",
    },

    {
        path: "users",
        component: UsersPageComponent,
        title: "Users",
    },

    {
        path: "expenses",
        component: ExpensesPageComponent,
        title: "Expenses",
    },

    {
        path: "register-user",
        component: AddUserPageComponent,
        title: "User Registration"
    },

    {
        path: "edit-user/:id",
        component: EditUserPageComponent,
    },

    {
        path: "expense-detail/:id",
        component: ExpenseDetaliPageComponent
    }
];


// Add guards for each protected routes
for (let i = 0; i < protectedRoutes.length; i++) {
    protectedRoutes[i].canActivate = [authGuardGuard];
}

export const routes: Routes = [

    {
        path: "signin",
        component: SigninPageComponent,
        title: "Sign In"
    },

    // add ang mga protected routes hehe
    ...protectedRoutes,


    {
        path: "**",
        component: PageNotFoundComponent,
        title: "Page Not Found"
    }
];
