 % Button pushed function: PlotButton
%function PlotButtonPushed(app, event)
    % Basic checks
    if isempty(app.DataTable)
        uialert(app.UIFigure, 'No data loaded. Press Start to import the Excel file.', 'No data');
        return;
    end
    if isempty(app.SelectedVar)
        uialert(app.UIFigure, 'No variable selected in the dropdown.', 'Select variable');
        return;
    end

    T = app.DataTable;
    t = app.TimeVector;

    chosen = app.SelectedVar;
    if ~ismember(chosen, T.Properties.VariableNames)
        uialert(app.UIFigure, sprintf('Selected variable "%s" not found in data.', chosen), 'Missing column');
        return;
    end

    y = T.(chosen);

    % Main graph — title: "Selected Variable: <pX>"
    cla(app.UIAxes);
    plot(app.UIAxes, t, y, 'LineWidth', 1.2);
    xlabel(app.UIAxes, 'Time (s) or sample index');
    ylabel(app.UIAxes, chosen);
    title(app.UIAxes, sprintf('Selected Variable: %s', chosen), 'Interpreter','none');
    grid(app.UIAxes, 'on');

    % Latitude plot: "Latitude vs Time"
    cla(app.UIAxes_lat);
    latname = app.LatName;
    if ~isempty(latname) && ismember(latname, T.Properties.VariableNames)
        plot(app.UIAxes_lat, t, T.(latname), 'LineWidth', 1.0);
        xlabel(app.UIAxes_lat, 'Time');
        ylabel(app.UIAxes_lat, 'Latitude');
        title(app.UIAxes_lat, 'Latitude vs Time');
        grid(app.UIAxes_lat,'on');
        axis(app.UIAxes_lat,'on');
    else
        cla(app.UIAxes_lat);
        text(app.UIAxes_lat, 0.1, 0.5, 'Latitude column not found', 'Units','normalized');
        title(app.UIAxes_lat,'Latitude');
        axis(app.UIAxes_lat,'off');
    end

    % Longitude plot: "Longitude vs Time"
    cla(app.UIAxes_lon);
    lonname = app.LonName;
    if ~isempty(lonname) && ismember(lonname, T.Properties.VariableNames)
        plot(app.UIAxes_lon, t, T.(lonname), 'LineWidth', 1.0);
        xlabel(app.UIAxes_lon, 'Time');
        ylabel(app.UIAxes_lon, 'Longitude');
        title(app.UIAxes_lon, 'Longitude vs Time');
        grid(app.UIAxes_lon,'on');
        axis(app.UIAxes_lon,'on');
    else
        cla(app.UIAxes_lon);
        text(app.UIAxes_lon, 0.1, 0.5, 'Longitude column not found', 'Units','normalized');
        title(app.UIAxes_lon,'Longitude');
        axis(app.UIAxes_lon,'off');
    end

    % Altitude plot: "Altitude vs Time"
    cla(app.UIAxes_alt);
    altname = app.AltName;
    if ~isempty(altname) && ismember(altname, T.Properties.VariableNames)
        plot(app.UIAxes_alt, t, T.(altname), 'LineWidth', 1.0);
        xlabel(app.UIAxes_alt, 'Time');
        ylabel(app.UIAxes_alt, 'Altitude');
        title(app.UIAxes_alt, 'Altitude vs Time');
        grid(app.UIAxes_alt,'on');
        axis(app.UIAxes_alt,'on');
    else
        cla(app.UIAxes_alt);
        text(app.UIAxes_alt, 0.1, 0.5, 'Altitude column not found', 'Units','normalized');
        title(app.UIAxes_alt,'Altitude');
        axis(app.UIAxes_alt,'off');
    end
%end
